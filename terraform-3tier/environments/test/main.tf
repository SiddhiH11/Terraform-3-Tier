module "vpc" {
  source   = "../../modules/vpc"
  env      = var.env
  vpc_cidr = var.vpc_cidr
  azs      = var.azs
}

module "s3" {
  source = "../../modules/s3"
  env    = var.env
}

module "rds" {
  source            = "../../modules/rds"
  env               = var.env
  private_subnets   = module.vpc.private_subnets
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
}

module "eks" {
  source          = "../../modules/eks"
  env             = var.env
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}