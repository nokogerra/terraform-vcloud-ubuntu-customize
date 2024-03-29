module "ubuntu-customization-module" {
  for_each                     = var.vms
  source                       = "./ubuntu-customization-module"
  mod_org_name                 = var.org_name
  mod_org_vdc                  = var.org_vdc
  mod_catalog_name             = var.catalog_name
  mod_catalog_org_name         = var.catalog_org_name
  mod_system_disk_bus          = var.system_disk_bus
  mod_system_disk_size         = var.system_disk_size
  mod_sys_disk_storage_profile = var.sys_disk_storage_profile
  mod_template_vm              = var.template_vm
  mod_storage_profile          = var.storage_profile
  mod_org_network              = var.org_network
  mod_vm_name                  = each.value.vm_name
  mod_ip_addr                  = each.value.ip_addr
  mod_vm_mem                   = each.value.vm_mem
  mod_vm_cpus                  = each.value.vm_cpus
  mod_add_disks                = var.add_disks
  mod_region                   = var.region
  mod_users                    = var.users
  mod_zabbix                   = var.zabbix
  mod_make_lvm                 = var.make_lvm
}

resource "null_resource" "remove_state" {
  provisioner "local-exec" {
    command     = "/usr/bin/rm *tfstate*"
    working_dir = path.root
  }
  depends_on = [module.ubuntu-customization-module]
}
