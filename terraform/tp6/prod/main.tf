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

module "ressource_mod" {

source = "../modules/ec2module"

instancetype = "t2.micro"

aws_common_tag = {
  Name = "ec2-prod-franck"
}

sec_group = "security_gp-prod"
}
