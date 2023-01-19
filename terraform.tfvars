#Provider vars
org_user                        = "user"
org_password                    = "password"
org_name                        = "org_name"
org_url                         = "https://cloud.fqdn/api"
org_vdc                         = "org_vdc"
org_max_retry_timeout           = 1800
org_allow_unverified_ssl        = true

org_edge_gw                     = "edge"
org_catalog                     = "catalog"
template_vm                     = "ubuntu-custom-template"
os_type                         = "ubuntu64Guest"
org_network                     = "test-external-net"
storage_profile                 = "DPLabCompNonSSD"

#System disk override vars. Disk override is going to commit the changes only if its section is not commented out inside the module (main.tf)
#In case you don't want to override the system disk, make sure, the override section is commented out in the module body.
sys_disk_storage_profile = "DPLabCompNonSSD"
system_disk_bus = "paravirtual"
system_disk_size = "20"

#In the following map variable you must specify VM, IP addresses and CPU/mem configuration according to your needs:
vms = {
    s1-custom-test01 = {
        vm_name = "s1-custom-test01"
        ip_addr = "10.215.147.11"
        vm_mem = "4"
        vm_cpus = "2"
    }
    s1-custom-test02 = {
        vm_name = "s1-custom-test02"
        ip_addr = "10.215.147.12"
        vm_mem = "8"
        vm_cpus = "4"
    }
}

#CUSTOMIZATION VARS
region = "pv"
users = "apkorol1,rvkarmal,vbpechen,mkonchev"

#to put the VM on monitoring, UNCOMMENT the line inside quotas:
zabbix = "#-z"

#to make LVMs on top of added disks, UNCOMMENT the line inside quotas:
make_lvm = "#/root/deploy/add-disk -O -D 2 -M /data"

#Data disks. Comment this var out, in case you do not need an additional disks.
#add_disks = {
#          disk1 = {
#            sizegb = "15"
#            bus_num = "0"
#            unit_num = "1"
#            storage_profile = "DPLabCompNonSSD" 
#            bus_type = "parallel" 
#          }
#          disk2 = {
#            sizegb = "5"
#            bus_num = "0"
#            unit_num = "2"
#            storage_profile = "DPLabCompNonSSD"
#            bus_type = "parallel"  
#          }
#}

