variable "net_id" {
  type = string
  description = "ID of the Outscale Net where the Subnet will be created"
}
variable "subnet_ip_range" {
  type = string
  description = "IP Range of Subnet in CIDR notation"
}
variable "subnet_name" {
  type = string
  description = "Name of the new Subnet"
}