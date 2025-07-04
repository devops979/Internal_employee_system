terraform {
  backend "s3" {
    bucket = "my-eks-terraform-state"
    key    = "support-portal/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
