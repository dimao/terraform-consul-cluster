provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "intes"

    workspaces {
      name = "prod"
    }
  }
}

# terraform {
#   backend "consul" {
#     address = "consul-server-0.its.local:8500"
#     scheme  = "http"
#     path    = "terraform/state"
#     datacenter = "its-dc"
#   }
# }
