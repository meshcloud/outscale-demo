variable "region" {
  type = string
  default = "eu-west-2"
}
variable "net_ip_range" {
  type = string
  description = "The network portion of the CIDR block must be between /16 and /28. More info in the docs here https://docs.outscale.com/en/userguide/About-Nets.html"
}
variable "net_name" {
  type = string
  description = "Name of the new Outscale Net"
}