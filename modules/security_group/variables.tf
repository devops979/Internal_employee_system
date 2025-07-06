variable "vpc_id" {
  description = "VPC ID where the SGs live"
  type        = string
}

variable "project" {
  description = "Name prefix for tagging"
  type        = string
}

variable "alb_ingress_cidrs" {
  description = "CIDR blocks allowed into ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "alb_ingress_ports" {
  description = "Listener ports (default 80 & 443)"
  type        = list(number)
  default     = [80, 443]
}
