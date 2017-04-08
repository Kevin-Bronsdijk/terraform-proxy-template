# C04_aws_access.config.tf
# public_cidr_blocks, allow incoming connections from
variable "ips" {
    type    = "map"
    default = {
		"public_cidr_blocks"     = "0.0.0.0/0"
    }
}