resource "outscale_internet_service" "internet_service01" {
  tags {
      key   = "name"
      value = "pm-test-internet-service"
  }
}

resource "outscale_internet_service_link" "internet_service_link01" {
  internet_service_id = outscale_internet_service.internet_service01.internet_service_id
  net_id              = var.net_id
}

resource "outscale_route_table" "route_table01" {
  net_id = var.net_id
  tags {
      key   = "name"
      value = "pm-test-route-table"
  }
}

resource "outscale_route_table_link" "route_table_link01" {
  subnet_id      = var.subnet_id
  route_table_id = outscale_route_table.route_table01.route_table_id
}

resource "outscale_route" "route01" {
    destination_ip_range = "${outscale_public_ip.public_ip01.public_ip}/32"
    gateway_id           = outscale_internet_service.internet_service01.internet_service_id
    route_table_id       = outscale_route_table.route_table01.route_table_id
    depends_on           = [outscale_internet_service_link.internet_service_link01,outscale_public_ip.public_ip01]
}

resource "outscale_public_ip" "public_ip01" {
}

resource "outscale_public_ip_link" "public_ip_link01" {
    vm_id     = outscale_vm.vm03.vm_id
    public_ip = outscale_public_ip.public_ip01.public_ip
    allow_relink = true
}

resource "outscale_nat_service" "nat_service01" {
    subnet_id    = var.subnet_id
    public_ip_id = outscale_public_ip.public_ip01.public_ip_id
    depends_on   = [outscale_route.route01]
}