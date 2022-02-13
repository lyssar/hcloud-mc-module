<h1 align="center">Welcome to Hetzner Cloud: Minecraft 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
  <a href="./docs" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="https://opensource.org/licenses/MIT" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
  <a href="https://twitter.com/lyssar__" target="_blank">
    <img alt="Twitter: lyssar__" src="https://img.shields.io/twitter/follow/lyssar__.svg?style=social" />
  </a>
</p>

> A terraform setup module to prepare a hetzner cloud instance for a minecraft server

## Install


You will reference the module directly as module.source from github. Make

```sh
module "minecraft-hcloud-example" {
  source = "git@github.com:lyssar/hcloud-mc-module.git"
}
```

## Usage

```sh
mkdir my-terraform-instance
cd my-terraform-instance
touch hcloud-minecraft.tf
curl aws.tf.example aws.tf
curl backend.tf.example backend.tf
```

Change `aws.tf` and `backend.tf` accordingly to your AWS S3 Bucket. This is needed in order to persist
the tfstate of you cloud instance

```terraform
# hcloud-minecraft.tf
module "minecraft-hcloud-example" {
  source = "git@github.com:lyssar/hcloud-mc-module.git"

  hcloud_token    = "YOUR_HCLOUD_TOKEN"

  instance_name   = "AWESOME_INSTANCE_NAME"
  rcon_pw         = "some_mc_server_rcon_password"
  public_key      = "YOUR_HCLOUD_SSH_PUB_KEY"
  private_key     = "YOUR_HCLOUD_SSH_PRIVATE_KEY"
  # Default java Version: 8
  # server_java_version = "11"
}
```

```sh
# Init your module
terraform init

# Plan to see what will be done
terraform plan 

# Apply your instance
terraform apply
```

If you want to get a minecraft instance up and running you can take a look into [lyssar/mcserver-ansible](https://github.com/lyssar/mcserver-ansible)
This is an ansible script to setup your MC Server with the [lyssar/msdcli](https://github.com/lyssar/msdcli) which is installed by default by the
terraform module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~> 1.32.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.32.1 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.mc_firewall](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |
| [hcloud_floating_ip.mc_pub_ip](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/floating_ip) | resource |
| [hcloud_floating_ip_assignment.mc_pub_ip_assignment](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/floating_ip_assignment) | resource |
| [hcloud_server.minecraft_server](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_ssh_key.user](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |
| [template_file.server_instance](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Token Variable Definition | `any` | n/a | yes |
| <a name="input_instance_backups"></a> [instance\_backups](#input\_instance\_backups) | n/a | `bool` | `false` | no |
| <a name="input_instance_image"></a> [instance\_image](#input\_instance\_image) | n/a | `string` | `"ubuntu-20.04"` | no |
| <a name="input_instance_ip_range"></a> [instance\_ip\_range](#input\_instance\_ip\_range) | n/a | `string` | `"10.0.1.0/24"` | no |
| <a name="input_instance_location"></a> [instance\_location](#input\_instance\_location) | n/a | `string` | `"nbg1"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | n/a | `string` | `"minecraft-server"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"cx41"` | no |
| <a name="input_msdcli_version"></a> [msdcli\_version](#input\_msdcli\_version) | n/a | `string` | `"1.2.0"` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | n/a | `any` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | Determining the ssh key that will be added to the instance when creating | `any` | n/a | yes |
| <a name="input_rcon_port"></a> [rcon\_port](#input\_rcon\_port) | n/a | `number` | `25575` | no |
| <a name="input_rcon_pw"></a> [rcon\_pw](#input\_rcon\_pw) | n/a | `any` | n/a | yes |
| <a name="input_server_java_version"></a> [server\_java\_version](#input\_server\_java\_version) | n/a | `string` | `"8"` | no |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | n/a | `number` | `25565` | no |
| <a name="input_system_user_password"></a> [system\_user\_password](#input\_system\_user\_password) | n/a | `string` | `"$6$o/N2KhKfqcP4$4mGl9UobHJR/67A1Z.Pf8Mrc.1ziWqUe6Lr6f9lwukQHPdaNKSfeAcbPpxD71E6AgRFhRp8vtLjgd0laDK.yJ."` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hcloud_public_server_ip4"></a> [hcloud\_public\_server\_ip4](#output\_hcloud\_public\_server\_ip4) | n/a |
| <a name="output_hcloud_server_ip4"></a> [hcloud\_server\_ip4](#output\_hcloud\_server\_ip4) | n/a |


## Author

👤 **Sebastian Hens**

* Website: http://lyssar.me/
* Twitter: [@lyssar__](https://twitter.com/lyssar__)
* Github: [@lyssar](https://github.com/lyssar)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/lyssar/hcloud-mc-module/issues). 

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2022 [Sebastian Hens](https://github.com/lyssar).<br />
This project is [MIT](https://opensource.org/licenses/MIT) licensed.

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
