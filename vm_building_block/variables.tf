variable "access_key_id" {
  type = string
  description = "Outscale Account Access Key"
}
variable "secret_key_id" {
  type = string
  sensitive = true
  description = "Outscale Secret Key"
}
variable "region" {
  type = string
  default = "eu-west-2"
}
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
}
variable "vm_type" {
  type = string
  description = "TINA, Legacy or AWS-compatible. Refer to Outscale docs for VM Types: https://docs.outscale.com/en/userguide/VM-Types.html"
}