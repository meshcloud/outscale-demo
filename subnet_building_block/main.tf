resource "outscale_subnet" "subnet01" {
    net_id   = var.net_id
    ip_range = var.subnet_ip_range
}