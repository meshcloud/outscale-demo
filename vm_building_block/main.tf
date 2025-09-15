resource "outscale_keypair" "keypair01" {
  keypair_name = "terraform-keypair-for-vm"
}

resource "outscale_vm" "app_vm" {
  image_id                       = var.image_id
  vm_type                        = var.vm_type
  security_group_ids             = [outscale_security_group.app_sg.id]
  subnet_id                      = var.subnet_id
  keypair_name                   = outscale_keypair.keypair01.keypair_name
  vm_initiated_shutdown_behavior = "terminate"
  block_device_mappings {
    device_name = "/dev/sda1" # /dev/sda1 corresponds to the root device of the VM
    bsu {
      delete_on_vm_deletion = false
      volume_size           = 15
      volume_type           = "gp2"
    }
  }
  tags {
    key   = "name"
    value = "pm-test-vm"
  }
  # install docker, pull nodejs helloworld, run in container
  user_data = base64encode(<<EOF
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
git clone https://github.com/IBM/node-hello-world.git
docker build -t node-hello-world:latest .
docker run -it -p 8080:8080 --name node-hello-world node-hello-world:latest
    EOF
  )
}

# resource "outscale_volume" "volume01" {
#     # subregion_name = "${var.subregion}a"
#     subregion_name = "eu-west-2a"
#     size           = 5
#     # iops           = 100
#     volume_type    = "gp2"
#     tags {
#         key   = "name"
#         value = "pm-test-volume"
#     }
# }

# resource "outscale_volume_link" "volume_link01" {
#     device_name = "/dev/sda1"
#     volume_id   = outscale_volume.volume01.id
#     vm_id       = outscale_vm.vm03.id
# }