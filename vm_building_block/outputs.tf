output "vm_ip" {
  value = outscale_vm.vm03.ip
}
output "keypair_name" {
  value = outscale_keypair.keypair01.keypair_name
}
output "private_ip" {
  value = outscale_vm.vm03.private_ip
}
output "public_ip" {
  value = outscale_vm.vm03.public_ip
}