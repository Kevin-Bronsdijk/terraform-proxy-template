# C02_aws_vpc.config.tf
variable "vpc" {
    type    = "map"
    default = {
        "cidr_block"                   = "172.31.0.0/16"
		"cidr_block_tinyproxy_config"  = "172.31.0.0\\/16"
        "subnet_bits"                  = "4"
    }
}