provider "vsphere" {
  version        = "1.5"
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

resource "vsphere_virtual_disk" "DBDisk01" {
  size         = 15
  datacenter   = "GRT"
  vmdk_path    = "persistent_disks\\DBDisk01.vmdk"
  datastore    = "Local_Storage"
  type         = "thin"
}
