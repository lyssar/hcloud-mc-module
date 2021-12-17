resource "hcloud_floating_ip_assignment" "atm6_pub_ip_assignment" {
  count = local.atm6.enable ? 1 : 0
  floating_ip_id = hcloud_floating_ip.atm6_pub_ip[0].id
  server_id      = hcloud_server.atm6[0].id
}

resource "hcloud_floating_ip" "atm6_pub_ip" {
  count = local.atm6.enable ? 1 : 0
  type          = "ipv4"
  home_location = "${local.atm6.instance_location}"
}

resource "hcloud_firewall" "atm6_firewall" {
  count = local.atm6.enable ? 1 : 0
  name = "atm6-${local.atm6.instance_name}-firewall"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "${local.atm6.server_port}"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "${local.atm6.rcon_port}"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}