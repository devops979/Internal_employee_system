output "alb_sg_id" {
  value       = aws_security_group.alb.id
  description = "Security Group ID for the Application Load Balancer"
}

output "backend_sg_id" {
  value       = aws_security_group.backend.id
  description = "Security Group ID for backend node group / pods"
}
