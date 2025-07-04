output "repository_urls" {
  description = "Map of repo_name ⇒ URL (registry/repo)"
  value       = { for k, r in aws_ecr_repository.this : k => r.repository_url }
}

output "registry_id" {
  description = "AWS account / registry ID"
  value       = element([for repo in values(aws_ecr_repository.this) : repo.registry_id], 0)
}


