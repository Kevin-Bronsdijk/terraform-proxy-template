# 05_aws_subnet_public-subnets.tf
# Create public subnets
resource "aws_subnet" "public-subnets" {
    vpc_id            = "${aws_vpc.env.id}"
    count             = "${length(split(",", lookup(var.azs, var.provider["region"])))}"
    cidr_block        = "${cidrsubnet(var.vpc["cidr_block"], var.vpc["subnet_bits"], count.index)}"
    availability_zone = "${element(split(",", lookup(var.azs, var.provider["region"])), count.index)}"
    tags {
        Name          = "${var.tags["tag"]}-public-subnet-${count.index}"
        Environment   = "${lower(var.tags["tag"])}"
		Scripted    = "yes"
    }
    map_public_ip_on_launch = true
}