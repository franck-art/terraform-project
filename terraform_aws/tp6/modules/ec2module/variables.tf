variable instancetype {
  type        = string
  description = "set aws instance type"
  default     = "t2.nano"
}

variable aws_common_tag {
  type        = map
  description = "set aws tag"
  default = {
    Name = "easytraining"
  }
}

variable sec_group {
  type        = string
  description = "set security group"
  default     = "sec_group"
}
