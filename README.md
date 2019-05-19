# consul-cluster

Configuration for consul cluster deployment with automatic SaltStack provision

## Usage Example:

```console
user@host:~$ terraform apply -var='vsphere_user=user' -var='vsphere_server=vcsa' -var='vsphere_password=password'
```

#### main.tf:
```
   module "virtual-machine" {
     source                = "git::https:// gitlab.intes.by/terraform/      vsphere-virtual-machine.git"
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
```
#### provision.sh:

Define SALT_VERSION and BOOTSTRAP_SALT_CHECKSUM from salt-bootstrap [GitHub]



[GitHub]: https://github.com/saltstack/salt-bootstrap