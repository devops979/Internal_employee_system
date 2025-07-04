variable "region" {
  default = "ap-south-1"
}
variable "project" {
  default = "support-portal"
}

variable "cluster_name" {
  default = "support-eks"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]

}
variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "db_name" {
  default = "employees"
}
variable "db_engine" {
  default = "mysql"
}
