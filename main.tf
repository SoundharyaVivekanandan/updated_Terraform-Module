provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5DG47IVSQCP6LBLZ"
  secret_key = "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"
}
module "vpc" {
  source                          = "./vpc"
  vpc_cidr                        = var.vpc_cidr
  private_subnet1_cidr            = var.private_subnet1_cidr
  private_subnet2_cidr            = var.private_subnet2_cidr
  availability_zone_private_subnet1 = var.availability_zone_private_subnet1
  availability_zone_private_subnet2 = var.availability_zone_private_subnet2
}


module "s3" {
  source           = "./s3"
  s3_bucket_name   = var.s3_bucket_name
}

module "rds" {
  source              = "./rds"
  db_allocated_storage = var.db_allocated_storage
}
  module "load_balancer" {
  source               = "./load_balancer"
  elb_security_group_name = "elb-security-group"
  common_cidr           = var.common_cidr
}


