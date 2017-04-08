# 08_aws_instance_proxy.tf
# Create proxy instances 
resource "aws_instance" "proxy" {
	connection {
		user = "${var.instance["user"]}"
		host = "${self.public_ip}"
		private_key = "${file("/usr/local/bin/instancekey2.pem")}"
	}
	count                       = "${var.proxy_instance_count}"
	subnet_id                   = "${element(aws_subnet.public-subnets.*.id, count.index)}"
  
	#instance_type               = "${var.instance["type"]}"
	#ami                         = "${var.instance["ami"]}"
	#key_name                    = "${var.instance["private_key_name"]}"
  
	instance_type = "t2.micro"
	ami = "ami-ee7bca8d"
	key_name = "instancekey2"
  
	vpc_security_group_ids      = ["${aws_security_group.proxy-instance.id}"]
	associate_public_ip_address = true
	monitoring = true

	provisioner "remote-exec" {
		inline = [
		"sudo apt-get -y update",  
		"sudo apt-get -y install tinyproxy",
		"sudo sed -i 's/Allow 127.0.0.1/Allow ${var.vpc["cidr_block_tinyproxy_config"]}/g' /etc/tinyproxy.conf",
		"sudo sleep 5",
		"sudo service tinyproxy stop",
		"sudo service tinyproxy start"
		]
	}
	tags {
		Name        = "${var.tags["tag"]}-aws_proxy-instance-${count.index}"
        Environment = "${lower(var.tags["tag"])}"
		Scripted    = "yes"
    }
}
