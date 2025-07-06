terraform {
  required_version = ">= 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.2.0"
    }
  }
}

provider "aws" {
  region = var.region
}


module "vpc" {
  source               = "./modules/vpc"
  name                 = "${var.project}-vpc"
  cidr_block           = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "security_group" {
  source = "./modules/security_group"
  project            = var.project
  vpc_id             = module.vpc.vpc_id
}


module "eks" {
  source             = "./modules/eks"
  project            = var.project
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids
  backend_sg_id      = module.security_group.backend_sg_id 
}


module "fargate" {
  source       = "./modules/fargate_profile"
  cluster_name = module.eks.eks_cluster_name # 🔧 fixed output name
  subnet_ids   = module.vpc.private_subnet_ids
  namespace    = "frontend"
  depends_on = [module.eks] # avoid race
}

module "rds" {
  source        = "./modules/rds"
  project       = var.project
  db_name       = var.db_name
  db_engine     = var.db_engine
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnet_ids
  allowed_sg_id = module.eks.cluster_security_group_id 
}


module "iam" {
  source = "./modules/iam"

  cluster_name      = module.eks.eks_cluster_name
  oidc_provider_arn = module.eks.cluster_oidc_provider_arn
  oidc_provider_url = module.eks.cluster_oidc_provider_url # ← NEW

  depends_on = [module.eks]
}


module "ecr" {
  source      = "./modules/ecr"
  project     = var.project
  repositories = [
    "flask-backend",
    "react-frontend"
  ]
}
