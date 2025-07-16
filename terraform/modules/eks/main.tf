module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  cluster_endpoint_public_access = true

  subnet_ids = var.private_subnet_ids
  vpc_id     = var.vpc_id

  eks_managed_node_groups = {
    ondemand = {
      desired_size = var.ondemand_desired_size
      min_size     = var.ondemand_min_size
      max_size     = var.ondemand_max_size
      instance_types = var.ondemand_instance_types
      capacity_type  = "ON_DEMAND"
      subnet_ids     = var.private_subnet_ids
    }
    spot = {
      desired_size = var.spot_desired_size
      min_size     = var.spot_min_size
      max_size     = var.spot_max_size
      instance_types = var.spot_instance_types
      capacity_type  = "SPOT"
      subnet_ids     = var.private_subnet_ids
    }
  }

  tags = var.tags
}
