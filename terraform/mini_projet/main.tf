provider "aws" {
  region     = "us-east-1"
  access_key = "xxx"
  secret_key = "xxx"

}


terraform {
  backend "s3" {
    bucket = "terraform-bucket-franck"
    key    = "terraform-state"
    region = "us-east-1"
    access_key = "AKIASYIPMFIHAVUYFSPO"
    secret_key = "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"
  }
}

module "security_mod" {

source = "./modules/app/sec_group_mod"

}

module "ec2_mod" {

source = "./modules/app/ec2_mod"

security_gp = module.security_mod.security_gp
name_key = "devops_franck"
}

module "ip_public_mod" {

source = "./modules/app/public_ip_mod"

instance_module = module.ec2_mod.ec2_instance

}


module "ebs_mod" {

source = "./modules/app/ebs_mod"
id_instance = module.ec2_mod.ec2_instance

}
