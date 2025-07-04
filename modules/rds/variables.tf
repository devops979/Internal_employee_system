variable "project" {
  description = "Prefix for naming DB resources"
  type        = string
}

variable "db_name" {
  description = "Initial database to create"
  type        = string
}

variable "db_engine" {
  description = "Database engine (postgres or mysql)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Specific engine version"
  type        = string
  default     = "8.0.36" # adjust if using MySQL
}

variable "vpc_id" {
  description = "VPC the RDS security group lives in"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "allowed_sg_id" {
  description = "Security-group ID of the backend (Flask) pods/EC2 nodes"
  type        = string
}
