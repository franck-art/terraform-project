provider "aws" {
  region     = "us-east-1"
  access_key = "AKIASYIPMFIHAVUYFSPO"
  secret_key = "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"

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

  security_groups = ["${aws_security_group.http_https.name}"]
  tags            = var.aws_common_tag

  root_block_device {
    delete_on_termination = true
  }

}


resource "aws_security_group" "http_https" {
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


}


resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
}
