provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "example" {
	ami = "ami-00068cd7555f543d5"
	instance_type = "t2.micro"
	security_groups = [aws_security_group.allow_ssh.name]
	tags = {
		Name = "terraform-example"
	}
}


resource "aws_security_group" "allow_ssh" {
	name = "allow ssh"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port   = 0
		protocol  = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}
