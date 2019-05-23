provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = true
}

# terraform {
#   backend "consul" {
#     address = "consul-server-0.its.local:8500"
#     scheme  = "http"
#     path    = "terraform/state"
#     datacenter = "its-dc"
#   }
# }