resource "vcd_vapp_vm" "vm" {
  vapp_name       = var.mod_vapp_name
  catalog_name    = data.vcd_catalog.my_cat.name
  template_name   = var.mod_template_vm
  memory          = var.mod_vm_mem * 1024
  cpus            = var.mod_vm_cpus
  storage_profile = var.mod_storage_profile
  computer_name   = var.mod_vm_name
  name            = var.mod_vm_name

  #  override_template_disk {
  #    size_in_mb      = var.mod_system_disk_size * 1024
  #    bus_type        = var.mod_system_disk_bus
  #    storage_profile = var.mod_sys_disk_storage_profile
  #    bus_number      = 0
  #    unit_number     = 0
  #  }
  network {
    type               = "org"
    name               = var.mod_vapp_network
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
  count = length(var.mod_vm_data_disks)

  vapp_name       = vcd_vapp_vm.vm.vapp_name
  vm_name         = vcd_vapp_vm.vm.name
  bus_type        = "paravirtual"
  size_in_mb      = var.mod_vm_data_disks[count.index].size * 1024
  bus_number      = 1
  unit_number     = count.index
  storage_profile = var.mod_storage_profile
}
