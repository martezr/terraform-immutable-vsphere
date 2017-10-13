resource "vsphere_virtual_disk" "DBDisk01" {
  size         = 20
  datacenter   = "GRT"
  vmdk_path    = "DBDisk01.vmdk"
  datastore    = "Local_Storage"
  type         = "thin"
  adapter_type = "lsiLogic"
}
