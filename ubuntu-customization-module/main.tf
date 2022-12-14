resource "vcd_vm" "vm" {
  catalog_name           = data.vcd_catalog.my_cat.name
  template_name          = var.mod_template_vm
  memory                 = var.mod_vm_mem * 1024
  memory_hot_add_enabled = true
  cpus                   = var.mod_vm_cpus
  cpu_hot_add_enabled    = true
  storage_profile        = var.mod_storage_profile
  computer_name          = var.mod_vm_name
  name                   = var.mod_vm_name

  #  override_template_disk {
  #    size_in_mb      = var.mod_system_disk_size * 1024
  #    bus_type        = var.mod_system_disk_bus
  #    storage_profile = var.mod_sys_disk_storage_profile
  #    bus_number      = 0
  #    unit_number     = 0
  #  }

  network {
    type               = "org"
    name               = var.mod_org_network
    ip_allocation_mode = "MANUAL"
    adapter_type       = "VMXNET3"
    ip                 = var.mod_ip_addr
  }
  customization {
    enabled                    = true
    allow_local_admin_password = false
    auto_generate_password     = false
    initscript                 = data.template_file.customization.rendered
  }
}

# Add VM data disks
resource "vcd_vm_internal_disk" "engine_disk" {
  for_each        = var.mod_add_disks
  vapp_name       = vcd_vm.vm.vapp_name
  vm_name         = vcd_vm.vm.name
  bus_type        = each.value.bus_type
  size_in_mb      = each.value.sizegb * 1024
  bus_number      = each.value.bus_num
  unit_number     = each.value.unit_num
  storage_profile = each.value.storage_profile
}
