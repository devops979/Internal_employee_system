output "irsa_role_name" {
  description = "Name of the IAM role used for Secrets IRSA"
  value       = aws_iam_role.irsa_secrets.name
}

output "irsa_role_arn" {
  description = "ARN of the IAM role used for Secrets IRSA"
  value       = aws_iam_role.irsa_secrets.arn
}

###############################
# ALB controller IRSA outputs #
###############################
output "alb_controller_role_arn" {
  description = "ARN of the IAM role used by the AWS-LB-Controller"
  value       = aws_iam_role.irsa_alb_controller.arn
}
