variable "access_key_id" {
  type = string
}
variable "secret_key_id" {
  type = string
  sensitive = true
}
variable "region" {
  type = string
  default = "eu-west-2"
}
variable "net_id" {
  type = string
  description = "ID of the Outscale Net where the Subnet will be created"
}
variable "¡p_range" {
  type = string
  description = "IP Range of Subnet in CIDR notation"
  default = "10.0.0.0/18"
}