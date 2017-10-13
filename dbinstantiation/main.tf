resource "vsphere_virtual_machine" "DB01" {
  name       = "terraform-db"
  vcpu       = 2
  memory     = 4096

  detach_unknown_disks_on_delete = "true"
  enable_disk_uuid = "true"


  network_interface {
    label              = "VM Network"
    ipv4_address       = "192.168.1.5"
    ipv4_prefix_length = "24"
    ipv4_gateway       = "192.168.1.254"
  }

  disk {
    template = "centos7temp"
    type     = "thin"
  }

  disk {
    vmdk           = "DBDisk01.vmdk"
    datastore      = "Local_Storage"
    type           = "thin"
    keep_on_remove = "true"
  }
}
