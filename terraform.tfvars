#Provider vars
org_user                        = "admin"
org_password                    = "P@ssw0rd"
org_name                        = "admin_org"
org_url                         = "https://vcloud.director.com/api"
org_vdc                         = "admin_org_vdc"
org_max_retry_timeout           = 1800
org_allow_unverified_ssl        = true

org_edge_gw                     = "admin_edge"
org_catalog                     = "org_catalog"
template_vm                     = "ubuntu-custom"
os_type                         = "ubuntu64Guest"
vapp_network                    = "kube-net02"
storage_profile                 = "DPLabCompNonSSD"

#System disk override vars. Disk override is going to commit the changes only if its section is not commented out inside the module (main.tf)
#In case you don't want to override the system disk, make sure, the override section is commented out in the module body.
sys_disk_storage_profile = "DPLabCompNonSSD"
system_disk_bus = "paravirtual"
system_disk_size = "20"

#VM vars
vapp_name                       = "test-appx2"
#Creation of user "ansible" is hardcoded in the userdata file, and the following ssh pub key will be added to ansible's authorized_keys.
#Don't like the ansible user? Go modify the userdata then. Otherwise you can make it via an additional variables (user related).
vm_cpus                         = "2"
vm_mem                          = "4"
#In case you don't need an additional disk, just comment out the disk list variable:
#vm_data_disks                   = [
#                                {
#                                size = "25"    
#                                }
#                            ]
#In the following map variable you must specify VM names and IP addresses according to your needs:
vms                             = {
                                s1-kub-test01 = {
                                    vm_name = "s1-kub-test01"
                                    ip_addr = "10.215.102.94"
                                }
                                s1-kub-test02 = {
                                    vm_name = "s1-kub-test02"
                                    ip_addr = "10.215.102.95"
                                }
#                                s1-kub-wn02 = {
#                                    vm_name = "s1-kub-wn02"
#                                    ip_addr = "10.215.101.12"
#                                }
#                                s1-kub-wn03 = {
#                                    vm_name = "s1-kub-wn03"
#                                    ip_addr = "10.215.101.13"
#                                }
}     
