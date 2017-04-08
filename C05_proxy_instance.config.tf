# C05_proxy_instance.config.tf
variable "instance" {
	type    = "map"
	default = {
		"type"             = "t1.micro"
		"user"             =  "ubuntu"
		"ami"              = "ami-ee7bca8d"
		"private_key_path" = "/usr/local/bin/instancekey2.pem"
		"private_key_name" = "instancekey2"
    }
}