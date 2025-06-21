module "prod_ec2" {
  source = "../modules/compute"

  ami             = "ami-0953476d60561c955"
  sg_id           = module.prod_sg.sg_id
  public_subnets  = module.prod_vpc.public_subnets
  private_subnets = module.prod_vpc.private_subnets

}