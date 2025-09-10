output "keypair_name" {
  value = outscale_keypair.keypair01.keypair_name
}
output "keypair_public_key" {
  value = outscale_keypair.keypair01.public_key
}
output "keypair_private_key" {
  value = outscale_keypair.keypair01.private_key
}
output "private_ip" {
  value = outscale_vm.vm03.private_ip
}
output "public_ip" {
  value = outscale_vm.vm03.public_ip
}