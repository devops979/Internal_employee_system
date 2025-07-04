output "irsa_role_name" {
  description = "The name of the IAM role used for IRSA"
  value       = aws_iam_role.irsa_secrets.name
}

output "irsa_role_arn" {
  description = "The ARN of the IAM role used for IRSA"
  value       = aws_iam_role.irsa_secrets.arn
}

output "irsa_assume_role_policy" {
  description = "The assume role policy document for IRSA"
  value       = data.aws_iam_policy_document.irsa_assume.json
}
