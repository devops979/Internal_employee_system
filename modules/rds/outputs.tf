output "db_instance_identifier" {
  description = "The identifier of the RDS instance"
  value       = aws_db_instance.this.identifier
}

output "db_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.this.endpoint
}

output "db_port" {
  description = "The port on which the RDS instance is listening"
  value       = aws_db_instance.this.port
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  value       = aws_db_subnet_group.this.name
}

output "db_engine" {
  description = "The database engine used by the RDS instance"
  value       = aws_db_instance.this.engine
}

output "db_name" {
  description = "The name of the initial database created"
  value       = aws_db_instance.this.name
}
