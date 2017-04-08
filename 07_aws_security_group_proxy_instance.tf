# 07_aws_security_group_proxy_instance.tf
# Access instances over ssh and tcp
resource "aws_security_group" "proxy-instance" {
	name        = "${var.tag["tag"]}-instance"
	vpc_id      = "${aws_vpc.env.id}"

	# ssh access 
	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["${var.ips["public_cidr_blocks"]}","${var.vpc["cidr_block"]}"]
	}

	# tcp access from the VPC
	ingress {
		from_port   = 8888 
		to_port     = 8888 
		protocol    = "tcp"
		cidr_blocks = ["${var.ips["public_cidr_blocks"]}","${var.vpc["cidr_block"]}"]
	}

	# outbound internet access
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	tags {
		Name        = "${var.tags["tag"]}-aws_security_group-instance"
        Environment = "${lower(var.tags["tag"])}"
		Scripted    = "yes"
	}
}
