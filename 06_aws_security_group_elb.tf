# 06_aws_security_group_elb.tf
# Create security group ELB 
resource "aws_security_group" "elb" {
	name        = "${var.tags["tag"]}-elb"
	vpc_id      = "${aws_vpc.env.id}"

	# tcp access
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
		Name        = "${var.tags["tag"]}-aws_security_group-elb"
        Environment = "${lower(var.tags["tag"])}"
		Scripted    = "yes"
    }
}