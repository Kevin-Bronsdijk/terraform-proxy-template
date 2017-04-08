# U01_aws_elb_proxy.tf
output "elb" {
	value = "${aws_elb.proxy.dns_name}"
}