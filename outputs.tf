output "cluster_name" {
  value = module.eks.eks_cluster_name
}
output "cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}
output "db_endpoint" {
  value = module.rds.db_endpoint
}

# convenient output so helm install can reference it
output "alb_controller_role_arn" {
  value = module.iam.alb_controller_role_arn
}