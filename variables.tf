# Provider vars
variable "vcd_user" {
  default     = "administrator"
  description = "vCD Tenant User"
}

variable "vcd_pass" {
  default     = "password"
  description = "vCD Tenant Password"
}

variable "org_name" {
  default     = "def_org"
  description = "vCD Tenant Org"
}

variable "org_vdc" {
  default     = "def_org_vdc"
  description = "vCD Tenant VDC"
}

variable "catalog_name" {
  description = ""
  default     = "default"
}

variable "catalog_org_name" {
  description = ""
  default     = "default"
}

variable "vcd_url" {
  default     = "https://vcd.vmcloud.reg.ru/api"
  description = "vCD Tenant URL"
}

variable "vcd_max_retry_timeout" {
  description = "Retry Timeout"
  default     = "240"
}

variable "vcd_allow_unverified_ssl" {
  description = "vCD allow unverified SSL"
  default     = "true"
}

variable "org_edge_gw" {
  description = "vCD edge name"
  default     = "none"
}

variable "template_vm" {
  description = "template vm"
  default     = "focal-server-cloudimg-amd64"
}

variable "system_disk_bus" {
  description = ""
  default     = "default"
}

variable "system_disk_size" {
  description = ""
  default     = "default"
}

variable "sys_disk_storage_profile" {
  description = ""
  default     = "default"
}

variable "os_type" {
  description = "OS Type"
  default     = "ubuntu64Guest"

}

variable "org_network" {
  description = ""
  default     = "dr-nw01-z01"
}

variable "storage_profile" {
  description = ""
  default     = "DPLabCompSSD"
}

#VM vars
variable "vms" {
  type = map(object({
    vm_name = string
    ip_addr = string
    vm_mem  = string
    vm_cpus = string
  }))
  default = {}
}

#Additional disks vars
variable "add_disks" {
  type = map(object({
    sizegb          = string
    bus_num         = string
    unit_num        = string
    storage_profile = string
    bus_type        = string
  }))
  default = {}
}

variable "region" {
  description = ""
  default     = "default"
}

variable "users" {
  description = ""
  default     = "default"
}

variable "zabbix" {
  description = ""
  default     = "default"
}

variable "make_lvm" {
  description = ""
  default     = "default"
}
