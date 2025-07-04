output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.this.name
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = aws_eks_cluster.this.arn
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = aws_eks_cluster.this.endpoint
}

output "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value       = aws_eks_cluster.this.version
}

output "eks_cluster_role_arn" {
  description = "The ARN of the IAM role used by the EKS cluster"
  value       = aws_iam_role.this.arn
}

output "node_group_name" {
  description = "The name of the managed node group"
  value       = aws_eks_node_group.backend_nodes.node_group_name
}

output "node_group_role_arn" {
  description = "The ARN of the IAM role used by the node group"
  value       = aws_iam_role.node.arn
}


output "cluster_security_group_id" {
  description = "Security group automatically created for the EKS control plane"
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "cluster_oidc_provider_arn" {
  description = "ARN of the IAM OIDC provider for the cluster"
  value       = aws_iam_openid_connect_provider.this.arn
}

output "cluster_oidc_provider_url" {
  description = "Issuer URL of the OIDC provider"
  value       = aws_iam_openid_connect_provider.this.url
}
  