variable "OUTSCALE_REGION" {
  type = string
  description = "Environment variable required for authentication"
  nullable = false
  default = "eu-west-2"
}
variable "OUTSCALE_ACCESSKEYID" {
  type = string
  description = "Environment variable required for authentication"
  nullable = false
}
variable "OUTSCALE_SECRETKEYID" {
  type = string
  description = "Environment variable required for authentication"
  nullable = false
  sensitive = true
}
variable "net_id" {
  type = string
  description = "ID of the Outscale Net where the Subnet will be created"
}
variable "subnet_ip_range" {
  type = string
  description = "IP Range of Subnet in CIDR notation"
}