provider "vcd" {
  user = var.vcd_user
  #token     = "TZ32qucUohJIKOG1YrYWxgVQPn26QNzb"
  #auth_type = "token"
  password             = var.vcd_pass
  sysorg               = "System"
  org                  = var.org_name # Default for resources
  vdc                  = var.org_vdc
  url                  = var.vcd_url
  max_retry_timeout    = var.vcd_max_retry_timeout
  allow_unverified_ssl = var.vcd_allow_unverified_ssl
}
