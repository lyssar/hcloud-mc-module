# Definition ssh key from variable
resource "hcloud_ssh_key" "user" {
    count = local.atm6.enable ? 1 : 0
    name = "user"
    public_key = file("${var.public_key}")
}