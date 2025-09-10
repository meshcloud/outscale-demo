variable "TF_VAR_OUTSCALE_REGION" {
  type = string
  nullable = false
}
variable "TF_VAR_OUTSCALE_ACCESSKEYID" {
  type = string
  nullable = false
}
variable "TF_VAR_OUTSCALE_SECRETKEYID" {
  type = string
  nullable = false
  sensitive = true
}
variable "net_id" {
  type = string
  description = "ID of the Outscale Net where the Subnet will be created"
}
variable "¡p_range" {
  type = string
  description = "IP Range of Subnet in CIDR notation"
}