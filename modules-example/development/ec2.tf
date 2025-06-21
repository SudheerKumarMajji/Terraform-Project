module "dev_ec2" {
  source = "../modules/compute"

  ami             = "ami-0953476d60561c955"
  sg_id           = module.dev_sg.sg_id
  public_subnets  = module.dev_vpc.public_subnets
  private_subnets = module.dev_vpc.private_subnets

}