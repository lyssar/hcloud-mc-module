resource "hcloud_floating_ip_assignment" "mc_pub_ip_assignment" {
  floating_ip_id = hcloud_floating_ip.mc_pub_ip.id
  server_id      = hcloud_server.minecraft_server.id
}

resource "hcloud_floating_ip" "mc_pub_ip" {
  type          = "ipv4"
  home_location = "${var.instance_location}"
}

resource "hcloud_firewall" "mc_firewall" {
  name = "mc-${var.instance_name}-firewall"

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
    port      = "${var.server_port}"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "${var.rcon_port}"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}
