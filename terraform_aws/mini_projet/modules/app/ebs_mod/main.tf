resource "aws_ebs_volume" "ebs_vol" {
  availability_zone = "us-east-1a"
  size              = var.size_ebs

  tags = {
    Name = "ebs-ec2-nginx"
  }
}

resource "aws_volume_attachment" "assoc_ebs_instance" {

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_vol.id
  instance_id = var.id_instance
}
