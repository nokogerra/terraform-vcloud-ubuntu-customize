data "template_file" "customization" {

  template = file("${path.module}/customization.sh")
  vars = {
    custom_hostname = "${var.mod_vm_name}"
  }
}

data "vcd_catalog" "my_cat" {
  org  = var.mod_org_name
  name = var.mod_org_catalog
}
