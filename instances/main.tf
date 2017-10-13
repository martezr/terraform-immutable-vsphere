resource "vsphere_virtual_machine" "Node01" {
  name       = "terraform-node"
  vcpu       = 2
  memory     = 4096  

  network_interface {
    label              = "VM Network"
    ipv4_address       = "192.168.1.4"
    ipv4_prefix_length = "24"
    ipv4_gateway       = "192.168.1.254"
  }

  provisioner "file" {
    source      = "nodeinstall.sh"
    destination = "nodeinstall.sh"

    connection {
      type        = "ssh"
      host        = "192.168.1.4"
      user        = "root"
      password    = "password"
    }
  }

 provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = "192.168.1.4"
      user        = "root"
      password    = "password"
    }

    inline = [
      "setenforce 0",
      "chmod +x /root/nodeinstall.sh && sh /root/nodeinstall.sh"
    ]
  }


  disk {
    template = "centos7temp"
    type     = "thin"
    datastore = "Local_Storage"
  }
}




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

  provisioner "file" {
    source      = "mongodbinstall.sh"
    destination = "mongodbinstall.sh"

    connection {
      type        = "ssh"
      host        = "192.168.1.5"
      user        = "root"
      password    = "password"
    }
  }

 provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = "192.168.1.5"
      user        = "root"
      password    = "password"
    }

    inline = [
      "mkdir /mongodb",
      "echo '/dev/sdb	/mongodb  ext4	defaults  0 0' >> /etc/fstab",
      "mount -a",
      "chmod +x /root/mongodbinstall.sh && sh /root/mongodbinstall.sh"
    ]
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
