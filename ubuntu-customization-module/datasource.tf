data "template_file" "customization" {

  template = file("${path.module}/customization.sh")
  vars = {
    custom_hostname = "${var.mod_vm_name}"
    custom_region   = "${var.mod_region}"
    custom_users    = "${var.mod_users}"
    custom_zabbix   = "${var.mod_zabbix}"
    custom_make_lvm = "${var.mod_make_lvm}"
  }
}

data "vcd_catalog" "my_cat" {
  org  = var.mod_org_name
  name = var.mod_org_catalog
}
