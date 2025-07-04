output "db_instance_identifier" {
  description = "The identifier of the RDS instance"
  value       = aws_db_instance.this.id
}

output "db_endpoint" {
  description = "Endpoint to connect to"
  value       = aws_db_instance.this.endpoint
}

output "db_port" {
  description = "Listening port"
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "Name of the database created"
  value       = aws_db_instance.this.db_name
}

output "db_secret" {
  description = "Generated admin password (expose only if you really need it)"
  value       = random_password.db.result
  sensitive   = true
}
