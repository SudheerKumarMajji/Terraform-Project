provider "aws" {
  region = var.aws_region
}
terraform {
  backend "s3" {
    bucket = "sudheertestforaws"
    key    = "dev.tfstate"
    region = "us-east-1"
  }
}

module "dev_vpc" {
  source       = "../modules/network"
  cidr_block   = "10.0.0.0/16"
  public_cidr  = "10.0.1.0/24"
  private_cidr = "10.0.2.0/24"
  vpc_name     = "dev_vpc"

}