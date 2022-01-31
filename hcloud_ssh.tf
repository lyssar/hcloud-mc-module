# Definition ssh key from variable
resource "hcloud_ssh_key" "user" {
    name = "user-${var.instance_name}"
    public_key = file("${var.public_key}")
}
