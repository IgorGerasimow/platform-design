terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

locals {
  base_tags = {
    Environment = var.environment
    Owner       = var.owner
    Ticket      = var.ticket
    Service     = var.service
  }

  default_tags = { for k, v in local.base_tags : k => v if v != "" }

  tags = merge(local.default_tags, var.tags)
}

provider "aws" {
  region = var.region
  default_tags {
    tags = local.default_tags
  }
}

module "vpc" {
  source = "./modules/vpc"
  name   = var.name
  vpc_cidr = var.vpc_cidr
  tags   = local.tags
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets

  tags = local.tags
}
