variable "net_id" {
  type = string
  description = "ID of the Network where the VM will be deployed"
}
variable "subnet_id" {
  type = string
  description = "ID of the Subnet where the VM will be deployed"
}
variable "image_id" {
  type = string
  default = "ami-eb899755"
}
variable "vm_type" {
  type = string
  description = "TINA, Legacy or AWS-compatible. Refer to Outscale docs for VM Types: https://docs.outscale.com/en/userguide/VM-Types.html"
  default = "tinav5.c1r1p3"
}
variable "allow_list_ip_range" {
  type = string
  default = "87.169.224.2/32"
}