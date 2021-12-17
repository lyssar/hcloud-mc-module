resource "hcloud_server" "atm6" {                         # Create a server
    count = local.atm6.enable ? 1 : 0
    name = "mc-atm6-${local.atm6.instance_name}"                     # Name server
    image = "${local.atm6.instance_image}"                  # Basic image
    server_type = "${local.atm6.instance_type}"             # Instance type
    location = "${local.atm6.instance_location}"            # Region
    backups = "${local.atm6.instance_backups}"              # Enable backups
    ssh_keys = ["${hcloud_ssh_key.user[0].id}"]              # SSH key
    user_data = data.template_file.atm6_instance[0].rendered
    firewall_ids = [ hcloud_firewall.atm6_firewall[0].id ]

    connection {
        host = hcloud_server.atm6[0].ipv4_address
        type     = "ssh"
        user     = "root"
        private_key = "${file(var.private_key)}"
    }

    provisioner "file" {                                  # Copying files to instances
        source = "user-data/atm6"                         # Path to file on local machine
        destination = "~/.minecraft"                      # Path to copy
    }

    provisioner "file" {
        content     = templatefile("${path.module}/user-data/server-properties.tpl", {
            level_name = local.atm6.world_name,
            server_ip = hcloud_floating_ip.atm6_pub_ip[0].ip_address
            level_type = local.atm6.world_generation_type
            level_seed = local.atm6.world_seed
            server_port = local.atm6.server_port
            rcon_port = local.atm6.rcon_port
            rcon_pw = sensitive(local.atm6.rcon_pw)
            gamemode = local.atm6.gamemode
            max_players = local.atm6.max_players
            difficulty = local.atm6.difficulty
        })
        destination = "~/.minecraft/server.properties"
    }

    provisioner "file" {
        content     = templatefile("${path.module}/user-data/atm6/service.tpl", {})
        destination = "/etc/systemd/system/mcserver.service"
    }

    provisioner "file" {
        content     = templatefile("${path.module}/user-data/floating_ip.tpl", {
            "server_pub_ip" = hcloud_floating_ip.atm6_pub_ip[0].ip_address
        })
        destination = "/etc/netplan/60-floating-server-ip.yaml"
    }
}

data "template_file" "atm6_instance" {
    count = local.atm6.enable ? 1 : 0
    template = "${file("${path.module}/user-data/atm6/instance.tpl")}"
    vars = {
        "user_password" = var.system_user_password
    }
}
