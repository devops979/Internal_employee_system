output "fargate_profile_name" {
  description = "The name of the EKS Fargate profile"
  value       = aws_eks_fargate_profile.this.fargate_profile_name
}

output "fargate_profile_arn" {
  description = "The ARN of the EKS Fargate profile"
  value       = aws_eks_fargate_profile.this.arn
}

output "fargate_iam_role_name" {
  description = "The name of the IAM role used for Fargate pod execution"
  value       = aws_iam_role.fargate.name
}

output "fargate_iam_role_arn" {
  description = "The ARN of the IAM role used for Fargate pod execution"
  value       = aws_iam_role.fargate.arn
}
