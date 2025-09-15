resource "outscale_security_group" "app_sg" {
  description         = "Application Security Group"
  security_group_name = "pm-test-app-sg"
  net_id              = var.net_id
}

resource "outscale_security_group_rule" "app_sgr_1" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.app_sg.security_group_id
  from_port_range   = "80"
  to_port_range     = "80"
  ip_protocol       = "tcp"
  ip_range          = "0.0.0.0/0"
}

resource "outscale_security_group_rule" "app_sgr_2" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.app_sg.security_group_id
  from_port_range   = "443"
  to_port_range     = "443"
  ip_protocol       = "tcp"
  ip_range          = "0.0.0.0/0"
}

resource "outscale_security_group_rule" "app_sgr_3" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.app_sg.security_group_id
  from_port_range   = "8080"
  to_port_range     = "8080"
  ip_protocol       = "tcp"
  ip_range          = "0.0.0.0/0"
}

resource "outscale_security_group_rule" "app_sgr_4" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.app_sg.security_group_id
  from_port_range   = "22"
  to_port_range     = "22"
  ip_protocol       = "tcp"
  ip_range          = "0.0.0.0/0"
}

# resource "outscale_internet_service" "internet_service01" {
#   tags {
#     key   = "name"
#     value = "pm-test-internet-service"
#   }
# }

# resource "outscale_internet_service_link" "internet_service_link01" {
#   internet_service_id = outscale_internet_service.internet_service01.internet_service_id
#   net_id              = var.net_id
# }

# resource "outscale_route_table" "route_table01" {
#   net_id = var.net_id
#   tags {
#     key   = "name"
#     value = "pm-test-route-table"
#   }
# }

# resource "outscale_route_table_link" "route_table_link01" {
#   subnet_id      = var.subnet_id
#   route_table_id = outscale_route_table.route_table01.route_table_id
# }

# resource "outscale_route" "route01" {
#   destination_ip_range = "0.0.0.0/0"
#   gateway_id           = outscale_internet_service.internet_service01.internet_service_id
#   route_table_id       = outscale_route_table.route_table01.route_table_id
#   depends_on           = [outscale_internet_service_link.internet_service_link01, outscale_public_ip.public_ip01]
# }

resource "outscale_public_ip" "public_ip01" {
  tags {
    key   = "name"
    value = "pm-test-public-ip"
  }
}

resource "outscale_public_ip_link" "public_ip_link01" {
  vm_id        = outscale_vm.app_vm.vm_id
  public_ip    = outscale_public_ip.public_ip01.public_ip
  allow_relink = true
}

# resource "outscale_nat_service" "nat_service01" {
#   subnet_id    = var.subnet_id
#   public_ip_id = outscale_public_ip.public_ip01.public_ip_id
#   depends_on   = [outscale_route.route01]
#   tags {
#     key   = "name"
#     value = "pm-test-nat-service"
#   }
# }