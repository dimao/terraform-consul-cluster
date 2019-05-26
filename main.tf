module "consul_cluster" {
  source             = "git::https://gitlab.intes.by/terraform/vsphere-virtual-machine.git"
  datacenter         = "its-dc"
  datastore          = "vmstorage"
  template_name      = "centos-golden"
  template_os_family = "linux"
  network            = "VM Network"
  resource_pool      = "cl1/Resources"

  vm_count       = "3"
  vm_name_prefix = "consul-server"
  num_cpus       = "2"
  memory         = "1024"

  provision             = "true"
  private_key_path      = "~/.ssh/id_rsa"
  provision_script_path = "provision.sh"
  tag_name              = "consul"
}

module "prometheus" {
  source               = "git::https://gitlab.intes.by/terraform/vsphere-virtual-machine.git"
  datacenter           = "its-dc"
  datastore            = "vmstorage"
  template_name        = "centos-golden"
  template_os_family   = "linux"
  network              = "VM Network"
  ipv4_network_address = "192.168.1.0/24"
  ipv4_address_start   = "12"
  ipv4_gateway         = "192.168.1.1"
  dns_servers          = ["192.168.1.3", "8.8.8.8"]
  domain_name          = "its.local"
  resource_pool        = "cl1/Resources"

  vm_count       = "1"
  vm_name_prefix = "prometheus"
  num_cpus       = "4"
  memory         = "2048"

  provision             = "true"
  backup = "true"
  private_key_path      = "~/.ssh/id_rsa"
  provision_script_path = "provision.sh"
  tag_name              = "consul"
}
