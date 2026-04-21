terraform {
  backend "s3" {
    bucket         = "terraform-statefile-207567756200-us-east-1-an"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}