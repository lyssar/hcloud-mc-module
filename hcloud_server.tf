resource "hcloud_server" "minecraft_server" {
    name = "mc-${var.instance_name}-${var.instance_name}"                     # Name server
    image = "${var.instance_image}"                  # Basic image
    server_type = "${var.instance_type}"             # Instance type
    location = "${var.instance_location}"            # Region
    backups = "${var.instance_backups}"              # Enable backups
    ssh_keys = ["${hcloud_ssh_key.user.id}"]              # SSH key
    user_data = data.template_file.server_instance.rendered
    firewall_ids = [ hcloud_firewall.mc_firewall.id ]

    connection {
        host = hcloud_server.minecraft_server.ipv4_address
        type     = "ssh"
        user     = "root"
        private_key = "${file(var.private_key)}"
    }

    provisioner "file" {
        content     = templatefile("${path.module}/templates/floating_ip.tpl", {
            "server_pub_ip" = hcloud_floating_ip.mc_pub_ip.ip_address
        })
        destination = "/etc/netplan/60-floating-server-ip.yaml"
    }
}

data "template_file" "server_instance" {
    template = "${file("${path.module}/templates/instance.tpl")}"
    vars = {
        "user_password" = var.system_user_password
        "msdcli_version" = var.msdcli_version
        "server_java_version" = var.server_java_version
        "intance_name" = var.instance_name
    }
}
