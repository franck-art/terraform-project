variable instancetype {
  type        = string
  description = "set aws instance type"
  default     = "t2.micro"
}


variable aws_common_tag {
  type        = map
  description = "set aws tag"
  default = {
    Name = "ec2-nginx"
  }
}

variable security_gp {
  type        = string
  description = "set security group"
  default = "security_group_var"
}


variable name_key {
  type        = string
  description = "set key name of ec2 instance"
  default     = "devops"
}
