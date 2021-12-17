output "hcloud_atm6_server_ip4" {
  depends_on = [hcloud_server.atm6]
  value = hcloud_server.atm6.*.ipv4_address
}

output "hcloud_atm6_public_server_ip4" {
  depends_on = [hcloud_floating_ip.atm6_pub_ip]
  value = hcloud_floating_ip.atm6_pub_ip.*.ip_address
}
