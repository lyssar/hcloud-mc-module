provider "hcloud" {                # Provider designation hetzner
    token = "${var.hcloud_token}"      # The token for connection to the hetzner API is specified in the terraform.tfvars file
}
