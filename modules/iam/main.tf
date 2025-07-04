data "aws_iam_policy_document" "irsa_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }
    condition {
      test     = "StringEquals"
      variable = "${replace(var.oidc_provider_arn, "https://", "")}:sub"
      values   = ["system:serviceaccount:backend:secrets-reader"]
    }
  }
}
resource "aws_iam_role" "irsa_secrets" {
  name               = "${var.cluster_name}-irsa-secrets"
  assume_role_policy = data.aws_iam_policy_document.irsa_assume.json
}

resource "aws_iam_role_policy_attachment" "secrets_access" {
  role       = aws_iam_role.irsa_secrets.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}
