terraform {
  backend "s3" {
    bucket       = "demo-usecases-bucket-new"
    key          = "usecase-17/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # New approach for state locking
  }
}
