# Token Variable Definition
variable "hcloud_token" {
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

# ATM6 Config
variable "atm6" {
    type = object({
        enable = optional(bool)
        instance_location = optional(string)
        instance_ip_range = optional(string)
        instance_name = optional(string)
        instance_image = optional(string)
        instance_type = optional(string)
        instance_backups = optional(bool)
        gamemode = optional(string)
        difficulty = optional(string)
        world_seed = optional(string)
        world_generation_type = optional(string)
        world_name = optional(string)
        max_players = optional(number)
        server_port = optional(number)
        rcon_port = optional(number)
        rcon_pw = optional(string)
    })
    description = "ATM6 configurations."
}
