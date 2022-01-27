# Token Variable Definition
variable "hcloud_token" {
    sensitive = true
}

variable "rcon_pw" {
    sensitive = true
}

variable "system_user_password" {
    default = "$6$o/N2KhKfqcP4$4mGl9UobHJR/67A1Z.Pf8Mrc.1ziWqUe6Lr6f9lwukQHPdaNKSfeAcbPpxD71E6AgRFhRp8vtLjgd0laDK.yJ."
}

# Determining the ssh key that will be added to the instance when creating
variable "public_key" {
    sensitive = true
}

variable "private_key" {
    sensitive = true
}

variable "server_java_version" {
    default = "8"
}

variable "mc_download_version" {
    default = "1.1.0"
}

variable "instance_image" {
    default = "ubuntu-20.04"
}

variable "instance_ip_range" {
    default = "10.0.1.0/24"
}

variable "instance_location" {
    default = "nbg1"
}

variable "instance_name" {
    default = "minecraft-server"
}

variable "instance_type" {
    default = "cx41"
}

variable "instance_backups" {
    default = false
}

variable "server_port" {
    default = 25565
}

variable "rcon_port" {
    default = 25575
}
