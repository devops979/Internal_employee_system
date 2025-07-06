############################
# A. IRSA role for Secrets
############################
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
      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"
      values   = [
        "system:serviceaccount:${var.sa_namespace}:${var.sa_name}"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.oidc_provider_url, "https://", "")}:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "irsa_secrets" {
  name               = "${var.cluster_name}-irsa-secrets"
  assume_role_policy = data.aws_iam_policy_document.irsa_assume.json
}

data "aws_iam_policy_document" "secrets_read" {
  statement {
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [var.secret_arn]
  }
}

resource "aws_iam_policy" "secrets_read" {
  name   = "${var.cluster_name}-secrets-read"
  policy = data.aws_iam_policy_document.secrets_read.json
}

resource "aws_iam_role_policy_attachment" "secrets_access" {
  role       = aws_iam_role.irsa_secrets.name
  policy_arn = aws_iam_policy.secrets_read.arn
}


###############################################
# B.  ALB controller – trust policy & role
###############################################
data "aws_iam_policy_document" "alb_irsa_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"
      values   = [
        "system:serviceaccount:${var.alb_sa_namespace}:${var.alb_sa_name}"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.oidc_provider_url, "https://", "")}:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "irsa_alb_controller" {
  name               = "${var.cluster_name}-alb-controller"
  assume_role_policy = data.aws_iam_policy_document.alb_irsa_assume.json
}


###############################################
# C.  Policy from AWSLoadBalancerController.json
###############################################
locals {
  alb_policy_json = file("${path.module}/AWSLoadBalancerController.json")
}

resource "aws_iam_policy" "alb" {
  name   = "${var.cluster_name}-alb-controller"
  policy = local.alb_policy_json
}

resource "aws_iam_role_policy_attachment" "alb_attach" {
  role       = aws_iam_role.irsa_alb_controller.name
  policy_arn = aws_iam_policy.alb.arn
}
