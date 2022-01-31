terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.32.1"
    }
  }
  required_version = "~> 1.1"
}
