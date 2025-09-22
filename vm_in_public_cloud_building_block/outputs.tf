output "keypair_private_key" {
  value = outscale_keypair.keypair01.private_key
}
output "ssh_commands" {
  value = "chmod 600 key.rsa; ssh -i key.rsa outscale@${outscale_vm.app_vm.public_ip}"
}
output "exposed_vm_ports" {
  value = "${outscale_security_group_rule.app_sgr_ssh.from_port_range}, ${outscale_security_group_rule.app_sgr_app.from_port_range}"
}