variable "net_id" {
  type = string
  description = "ID of the Outscale Net where the Subnet will be created"
}
variable "¡p_range" {
  type = string
  description = "IP Range of Subnet in CIDR notation"
  default = "10.0.0.0/18"
}