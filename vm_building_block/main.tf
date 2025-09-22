resource "outscale_keypair" "keypair01" {
  keypair_name = "terraform-keypair-for-vm"
}

resource "outscale_vm" "app_vm" {
  image_id                       = var.image_id
  vm_type                        = var.vm_type
  security_group_ids             = [outscale_security_group.app_sg.id]
  keypair_name                   = outscale_keypair.keypair01.keypair_name
  placement_subregion_name       = var.subregion
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "terminate"
  tags {
    key   = "name"
    value = "pm-test-vm"
  }
}