variable "project" {
  description = "Prefix for repository names and tags"
  type        = string
}

variable "repositories" {
  description = "List of ECR repositories to create"
  type        = list(string)
  default     = ["flask-backend", "react-frontend"]
}

variable "scan_on_push" {
  description = "Enable image vulnerability scanning on push"
  type        = bool
  default     = true
}

variable "tag_immutability" {
  description = "true → tags are immutable; false → mutable"
  type        = bool
  default     = true
}

variable "retain_days" {
  description = "If >0, keep only images younger than this (lifecycle rule)"
  type        = number
  default     = 30
}
