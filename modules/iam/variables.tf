variable "cluster_name" {
  type = string
  default= "support-eks"
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

# NEW –- ALB controller service-account values
variable "alb_sa_namespace" { 
  type = string 
  default = "kube-system" 
  }

variable "alb_sa_name"      { 
  type = string 
  default = "aws-load-balancer-controller" 
  }



variable "secret_arn" {
  type    = string
  default = "*"
} # tighten later
