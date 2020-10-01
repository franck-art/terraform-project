provider "aws" {
  region     = "us-east-1"
  access_key = "xxx"
  secret_key = "xxx"

}

resource "aws_instance" "myec2" {
  ami           = "ami-0083662ba17882949"
  instance_type = "t2.micro"
  key_name      = "devops_franck"
  tags = {
    Name = "ec2-franck"
  }

  root_block_device {
    delete_on_termination = true
  }

}
