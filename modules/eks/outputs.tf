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
