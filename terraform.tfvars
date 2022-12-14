#Provider vars
org_user                        = "admin"
org_password                    = "P@ssword"
org_name                        = "org"
org_url                         = "https://iaaslab.cloud.mts.ru/api"
org_vdc                         = "org_vdc"
org_max_retry_timeout           = 1800
org_allow_unverified_ssl        = true

org_edge_gw                     = "org_vdc_edge"
org_catalog                     = "org_catalog"
template_vm                     = "ubuntu-custom-template"
os_type                         = "ubuntu64Guest"
org_network                     = "kube-net02"
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
        ip_addr = "10.215.102.71"
        vm_mem = "4"
        vm_cpus = "2"
    }
    s1-custom-test02 = {
        vm_name = "s1-custom-test02"
        ip_addr = "10.215.102.72"
        vm_mem = "8"
        vm_cpus = "4"
    }
}
#Data disks. Comment this var out, in case you do not need an additional disks.
add_disks = {
          disk1 = {
            sizegb = "15"
            bus_num = "1"
            unit_num = "0"
            storage_profile = "DPLabCompNonSSD" 
            bus_type = "parallel" 
          }
          disk2 = {
            sizegb = "5"
            bus_num = "1"
            unit_num = "1"
            storage_profile = "DPLabCompNonSSD"
            bus_type = "parallel"  
          }
}

