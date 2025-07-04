locals {
  full_repo_names = {
    for name in var.repositories :
    name => "${var.project}-${name}"
  }
}

resource "aws_ecr_repository" "this" {
  for_each             = local.full_repo_names
  name                 = each.value
  image_tag_mutability = var.tag_immutability ? "IMMUTABLE" : "MUTABLE"

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Project = var.project
    Repo    = each.value
  }
}

# Optional lifecycle rule – prune untagged and old images
resource "aws_ecr_lifecycle_policy" "cleanup" {
  for_each   = var.retain_days > 0 ? aws_ecr_repository.this : {}
  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expire untagged and old images"
        selection = {
          tagStatus   = "any"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = var.retain_days
        }
        action = { type = "expire" }
      }
    ]
  })
}
