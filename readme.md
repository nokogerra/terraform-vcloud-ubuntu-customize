## Just a simple module to create Ubuntu VM from template in VMware Cloud Director 10.x
In case you want to use bare VMware customization **without cloud-init** (and this recipe is just about that kind of usage), then read the following with caution:<br />
cloud-init is installed by default on Ubuntu 20.04 LTS even if you have deployed it manually via ISO file.<br />
So, since you don't provide cloud-init with its datasource, it is going to make some stupid things (subiquity in particular): it creates a config file in /etc/netplan, which will conflict with VMware customization config file later.<br />
Whatever it was, make sure:
* there are no files in /etc/netplan/ in the OS before you will shutdown the VM to make a template from it (next time you boot this VM it will has no IP addr);
* check if /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg has the line "network: {config: disabled}"
* you can even remove cloud-init, mind it on your own. E.g. https://gist.github.com/zoilomora/f862f76335f5f53644a1b8e55fe98320.

**Also it is very useful to enable customization scripts execution**, follow VMware KB "Setting the customization script for virtual machines in vSphere 7.x and 8.x (74880)": https://kb.vmware.com/s/article/74880.<br />

### Additional disks but type
Be careful choosing bus type for a data disks. In case your template has system disk (0:0) with Parallel but type, and you are going to add data disks to a Paravirtual bus (1:x), your Ubuntu guest OS will change system disk letter (e.g. from sda to sdb)! It's safer to add data disks to the same bus type as a system disk attached to. It just means not the same bus, but the **same bus type**.

### System disk override
If you need to override system disk parameters, then uncomment the corresponding section in main.tf of the "ubuntu-customization-module".

### CPU and Memory hot-add
CPU hot-add and Memory hot-plug are enabled and hardcoded in module "ubuntu-customization-module".