resource "aws_eip" "lb" {
  instance = var.instance_module
  vpc      = true
}
