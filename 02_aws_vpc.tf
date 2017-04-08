# 02_aws_vpc.tf
# Create VPC 
resource "aws_vpc" "env" {
    cidr_block           = "${var.vpc["cidr_block"]}"
    enable_dns_support   = true
    enable_dns_hostnames = true 
    tags {
        Name        = "VPC-${var.tags["tag"]}"
        Environment = "${lower(var.tags["tag"])}"
		Scripted    = "yes"
    }
}