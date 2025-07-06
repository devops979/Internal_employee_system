variable "project" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "public_subnet_ids" {
  type = list(string)
}

variable "k8s_version" {
  type    = string
  default = "1.30"
}

variable "backend_instance_type" {
  type    = string
  default = "t3.medium"
}


variable "backend_sg_id" {
  type        = string
  description = "Security group ID for backend nodes (Flask pods)"
  
}