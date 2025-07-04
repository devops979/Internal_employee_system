resource "aws_eks_fargate_profile" "this" {
  cluster_name           = var.cluster_name
  fargate_profile_name   = "${var.namespace}-fargate"
  subnet_ids             = var.subnet_ids
  pod_execution_role_arn = aws_iam_role.fargate.arn

  selector {
    namespace = var.namespace
  }
}

data "aws_iam_policy_document" "fargate_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals { type = "Service"; identifiers = ["eks-fargate-pods.amazonaws.com"] }
  }
}

resource "aws_iam_role" "fargate" {
  name               = "${var.namespace}-fargate-role"
  assume_role_policy = data.aws_iam_policy_document.fargate_assume_role.json
}

resource "aws_iam_role_policy_attachment" "fargate" {
  role       = aws_iam_role.fargate.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
}
