provider "aws" {
  region     = "us-east-1"
  access_key = "AKIASYIPMFIHAVUYFSPO"
  secret_key = "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"
}

terraform {
  backend "s3" {
    bucket = "terraform-bucket-franck"
    key    = "dev/terraform-state"
    region = "us-east-1"
    access_key = "AKIASYIPMFIHAVUYFSPO"
    secret_key = "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"
  }
}

module "ressource_mod" {

source = "../modules/ec2module"

instancetype = "t2.nano"

aws_common_tag = {
  Name = "ec2-dev-franck"
}

sec_group = "security_gp-dev"
}
