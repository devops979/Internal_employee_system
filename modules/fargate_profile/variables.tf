variable "cluster_name" {
  type = string
}

variable "namespace" {
  type    = string
  default = "frontend"
}

variable "subnet_ids" {
  type = list(string)
}
