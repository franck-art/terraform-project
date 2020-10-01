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
  key_name      = var.name_key

  security_groups = ["${var.security_gp}"]
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
    "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
  ]
}

}
