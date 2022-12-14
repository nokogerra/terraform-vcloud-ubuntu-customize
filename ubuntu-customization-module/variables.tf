variable "mod_org_name" {
  description = ""
  default     = "default"
}

variable "mod_org_catalog" {
  description = ""
  default     = "default"
}

variable "mod_template_vm" {
  description = ""
  default     = "default"
}

variable "mod_system_disk_bus" {
  description = ""
  default     = "default"
}

variable "mod_system_disk_size" {
  description = ""
  default     = "default"
}

variable "mod_vm_mem" {
  description = ""
  default     = "2"
}
variable "mod_vm_cpus" {
  description = ""
  default     = "default"
}

variable "mod_storage_profile" {
  description = ""
  default     = "default"
}

variable "mod_sys_disk_storage_profile" {
  description = ""
  default     = "default"
}

variable "mod_vm_name" {
  description = ""
  default     = "default"
}

variable "mod_org_network" {
  description = ""
  default     = "default"
}

variable "mod_ip_addr" {
  description = ""
  default     = "default"
}

#Additional disks vars
variable "mod_add_disks" {
  type = map(object({
    sizegb          = string
    bus_num         = string
    unit_num        = string
    storage_profile = string
    bus_type        = string
  }))
  default = {}
}
