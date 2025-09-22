variable "image_id" {
  type        = string
  default     = "ami-0016b8a0"
  description = "VM Image. Default value is Ubuntu 24.04-2025-07-07"
}
variable "vm_type" {
  type        = string
  description = "TINA, Legacy or AWS-compatible. Refer to Outscale docs for VM Types: https://docs.outscale.com/en/userguide/VM-Types.html"
  default     = "t2.small"
}
variable "allow_list_ip_range" {
  type        = string
  description = "IP Range that will be allowed to connect to the VM. Enter 0.0.0.0/0 to allow all traffic"
}
variable "subregion" {
  type        = string
  default     = "eu-west-2a"
  description = "Outscale Subregion for the VM"
}
variable "vm_name" {
  type        = string
  description = "Name of the VM in Outscale"
}