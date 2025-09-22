resource "outscale_security_group" "app_sg" {
  description         = "Application Security Group"
  security_group_name = "app-sg"
}

resource "outscale_security_group_rule" "app_sgr_ssh" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.app_sg.security_group_id
  from_port_range   = "22"
  to_port_range     = "22"
  ip_protocol       = "tcp"
  ip_range          = var.allow_list_ip_range
}

resource "outscale_security_group_rule" "app_sgr_app" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.app_sg.security_group_id
  from_port_range   = "8080"
  to_port_range     = "8080"
  ip_protocol       = "tcp"
  ip_range          = var.allow_list_ip_range
}