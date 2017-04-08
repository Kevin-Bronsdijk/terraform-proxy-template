# C03_aws_vpc.config.tf
variable "tags" {
    type    = "map"
    default = {
		"tag"     = "proxy"
    }
}