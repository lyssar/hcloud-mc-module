terraform {
    experiments = [module_variable_optional_attrs]
    backend "s3" {                          # Backend designation
        profile = "hetzner"
        bucket = "minecraft-tf"                # Bucket name
        key = "bucket/terraform.tfstate"        # Key
        region = "eu-central-1"                    # Region
        encrypt = "true"                        # Encryption enabled
    }
}