terraform {
  backend "s3" {
    bucket         = "backend-state-bucket-123456789"
    key            = "cust-network/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}


