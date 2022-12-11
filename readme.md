In case you want to use bare VMware customization **without cloud-init** (and this recipe is just about that kind of usage), then read the following with caustion:<br />
cloud-init is installed by default on Ubuntu 20.04 LTS even if you have deployed it manually via ISO file.<br />
So, since you don't provide cloud-init with its datasource, it is going to make some stupid thing (subiquity in particular): create a config file in /etc/netplan, which will conflict with VMware customization config file later.<br />
Whatever it was, make sure:
* there are no files in /etc/netplan/ in the OS before you will shutdown the VM to make a template from it;
* check if /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg has the line "network: {config: disabled}"
* you can even remove cloud-init, mind it on your own.

Also it is useful to follow VMware KB "Setting the customization script for virtual machines in vSphere 7.x and 8.x (74880)": https://kb.vmware.com/s/article/74880.

