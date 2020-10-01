provider "aws" {
  region     = "us-east-1"
  access_key = "xxx"
  secret_key = "xxx"
}

terraform {
  backend "s3" {
    bucket = "terraform-bucket-franck"
    key    = "prod/terraform-state"
    region = "us-east-1"
    access_key = "xxx"
    secret_key = "xxx"
  }
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instancetype
  key_name      = "devops_franck"

  security_groups = ["${aws_security_group.ssh_http_https.name}"]
  tags            = var.aws_common_tag

  root_block_device {
    delete_on_termination = true
  }

  provisioner "remote-exec" {

    connection {
   type     = "ssh"
   user     = "ec2-user"
   //password = "${var.root_password}"
   host     = "${self.public_ip}"
   private_key = file("./devops_franck.pem")

 }

  inline = [
    "sudo amazon-linux-extras install nginx1.12 -y",
    "sudo systemctl start nginx",
  ]
}

}


resource "aws_security_group" "ssh_http_https" {
  name        = "security_gs"
  description = "Allow http and https inbound traffic"

  ingress {
    description = "https from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

}


resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
}
