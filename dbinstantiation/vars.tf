variable "vsphere_user" {
  description = "vSphere user"
}
 
variable "vsphere_password" {
  description = "vsphere password"
}
  
variable "vsphere_server" {
  description = "vsphere server"
}

variable "vsphere_datacenter" {
  description = "VMware vSphere Datacenter Name"
}

variable "vsphere_cluster" {
  description = "VMware vSphere Computer Cluster Name"
}

variable "vsphere_network" {
  description = "VMware vSphere Network Name"
}

variable "vsphere_datastore" {
  description = "VMware vSphere Datastore"
}

variable "vsphere_template" {
  description = "VMware vSphere Virtual Machine Template"
}

variable "vm_name" {
  description = "VMware vSphere Virtual Machine Name"
}

variable "vm_cpus" {
  description = "Number of vCPUs"
}

variable "vm_memory" {
  description = "Amount of memory assigned to the virtual machine"
}

variable "vm_domain_name" {
  description = "Virtual machine domain name"
}

variable "vm_ip_address" {
  description = "Virtual machine IP address"
}

variable "vm_default_gateway" {
  description = "Virtual machine default gateway"
}

variable "vm_network_cidr" {
  description = "Virtual machine network cidr"
  default = 24
}
