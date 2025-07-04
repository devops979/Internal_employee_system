variable "region" { default = "us-east-1" }
variable "project" { default = "support-portal" }

variable "cluster_name" { default = "support-eks" }

variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "azs" { type = list(string) }
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }

variable "db_name" { default = "employees" }
variable "db_engine" { default = "postgres" }
