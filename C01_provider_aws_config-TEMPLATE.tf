# C01_provider_aws_config.tf
variable "provider" {
    type = "map"
    default = {
        "access_key"  = ""
        "secret_key"  = ""
        "region"      = ""
    }
}