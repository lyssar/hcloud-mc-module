output "hcloud_server_ip4" {
  depends_on = [hcloud_server.minecraft_server]
  value = hcloud_server.minecraft_server.ipv4_address
}

output "hcloud_public_server_ip4" {
  depends_on = [hcloud_floating_ip.mc_pub_ip]
  value = hcloud_floating_ip.mc_pub_ip.ip_address
}
