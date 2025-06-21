provider "aws" {
  region = var.aws_region
}
terraform {
  backend "s3" {
    bucket = "sudheertestforaws"
    key    = "prod.tfstate"
    region = "us-east-1"
  }
}

module "prod_vpc" {
  source       = "../modules/network"
  cidr_block   = "192.168.0.0/16"
  public_cidr  = "192.168.1.0/24"
  private_cidr = "192.168.2.0/24"
  vpc_name     = "prod_vpc"
}