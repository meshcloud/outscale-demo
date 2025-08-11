resource "outscale_security_group" "security_group01" {
    description          = "Terraform security group for VM"
    security_group_name = "terraform-security-group-for-vm"
    net_id               = var.net_id
}

resource "outscale_vm" "vm03" {
    image_id           = var.image_id
    vm_type            = var.vm_type
    security_group_ids = [outscale_security_group.security_group01.security_group_id]
    subnet_id          = var.subnet_id
}