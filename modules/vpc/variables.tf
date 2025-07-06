# Base name that will appear in VPC-related tags
variable "name" {
  description = "Prefix used in Name tags for all VPC resources"
  type        = string
  default     = "support-portal"
}

# Top-level CIDR block for the VPC
variable "cidr_block" {
  description = "Primary CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Availability Zones to spread subnets across
variable "azs" {
  description = "List of AZs—must align 1-to-1 with subnet CIDR lists below"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Public subnet CIDRs (one per AZ)
variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Private subnet CIDRs (one per AZ)
variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}


variable "cluster_name" {

  description = "EKS cluster name for tagging and discovery"
  type        = string
}