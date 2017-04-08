# 03_aws_internet_gateway.tf
# Create internet gateway
resource "aws_internet_gateway" "env" {
    vpc_id = "${aws_vpc.env.id}"
    tags {
        Name        = "${var.tags["tag"]}-internet-gateway"
        Environment = "${lower(var.tags["tag"])}"
		Scripted    = "yes"
    }
}