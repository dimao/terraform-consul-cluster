module "virtual-machine" {
  source                = "git::https://gitlab.intes.by/terraform/vsphere-virtual-machine.git"
  datacenter            = "its-dc"
  datastore             = "vmstorage"
  template_name         = "centos-golden"
  template_os_family    = "linux"
  network               = "VM Network"
  resource_pool         = "cl1/Resources"

  vm_count              = "3"
  vm_name_prefix        = "consul"
  num_cpus              = "2"
  memory                = "1024"

  provision             = "true"
  private_key_path      = "~/.ssh/id_rsa"
  provision_script_path = "provision.sh"
  tag_name              = "consul-server"
}


