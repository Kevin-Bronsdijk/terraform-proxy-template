# 09_aws_elb_proxy.tf
# Create Elastic Load Balancing
resource "aws_elb" "proxy" {
	name               = "${var.tags["tag"]}-elb"
	subnets         = ["${aws_subnet.public-subnets.*.id}"]
	security_groups    = ["${aws_security_group.elb.id}"]
	instances          = ["${aws_instance.proxy.*.id}"]

	listener {
		instance_port     = 8888 
		instance_protocol = "tcp"
		lb_port           = 8888 
		lb_protocol       = "tcp"
	}

    tags {
        Name        = "${var.tags["tag"]}-elb"
        Environment = "${lower(var.tags["tag"])}"
		Scripted    = "yes"
    }
}