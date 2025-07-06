variable "cluster_name" {
  type = string
}
variable "oidc_provider_arn" {
  type = string
}
variable "oidc_provider_url" {
  type = string
}
variable "sa_namespace" {
  type    = string
  default = "backend"
}
variable "sa_name" {
  type    = string
  default = "flask-backend-sa"
}
variable "secret_arn" {
  type    = string
  default = "*"
} # tighten later
