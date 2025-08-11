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