# Definition ssh key from variable
resource "hcloud_ssh_key" "user" {
    name = "user"
    public_key = file("${var.public_key}")
}
