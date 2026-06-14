resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "backend-state-bucket-123456789"
  }

resource "aws_dynamodb_table" "terraform-lock-dynamodb" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}