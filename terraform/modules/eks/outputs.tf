output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "node_group_role_arn" {
  description = "Node group IAM role ARN"
  value       = module.eks.node_group_iam_role_arns
}
