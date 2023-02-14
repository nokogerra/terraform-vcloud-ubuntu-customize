#-----Provider vars-----#

#System-wide administrator
vcd_user                        = "administrator"
vcd_pass                        = "P@ssw0rd"
vcd_url                         = "https://vcloud.fqdn/api"
vcd_max_retry_timeout           = 1800
vcd_allow_unverified_ssl        = true

#Organization vars
org_name                        = "org_name"
org_vdc                         = "org_vdc_name"
org_edge_gw                     = "org_vdc_edge_name"
org_network                     = "test-external-net"
storage_profile                 = "DPLabCompNonSSD"


#-----Catalog vars-----#

#Name of the catalog's owning vCD organization (usually a single Org made by a Provider)
catalog_org_name                = "Org-Catalogs"
catalog_name                    = "Ubuntu"
template_vm                     = "ubuntu-focal-20.04"



#-----VMs vars-----#

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
add_disks = {
          disk1 = {
            sizegb = "15"
            bus_num = "0"
            unit_num = "1"
            storage_profile = "DPLabCompNonSSD" 
            bus_type = "paravirtual" 
          }
#          disk2 = {
#            sizegb = "5"
#            bus_num = "0"
#            unit_num = "2"
#            storage_profile = "DPLabCompNonSSD"
#            bus_type = "parallel"  
#          }
}

