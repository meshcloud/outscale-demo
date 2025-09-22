resource "outscale_net" "net02" {
    ip_range = var.net_ip_range
    tags {
      key = "name"
      value = var.net_name
    }
}