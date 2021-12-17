provider "hcloud" {                # Provider designation hetzner
    token = "${var.hcloud_token}"      # The token for connection to the hetzner API is specified in the terraform.tfvars file
}

locals {
    defaults = {
        enable = false
        difficulty = "easy"
        gamemode = "survival"
        instance_image = "ubuntu-20.04"
        instance_ip_range = "10.0.1.0/24"
        instance_location = "nbg1"
        instance_name = "minecraft-server"
        instance_type = "cx41"
        instance_backups = false
        world_name = "ATM6-World"
        world_seed = ""
        world_generation_type = "terraforged\\:terraforged"
        max_players = 20
        rcon_port = 25575
        rcon_pw = ""
        server_port = 25565
    }

    atm6 = defaults(var.atm6, local.defaults)
    # mc_settings = defaults(var.mcserver, local.defaults)
}