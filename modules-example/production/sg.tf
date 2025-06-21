module "prod_sg" {
  
  source = "../modules/sg"
  vpc_id = module.prod_vpc.vpc_id
  
}