resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket12154681111111"
}

resource "aws_instance" "dev" {
  ami           = "ami-0e38835daf6b8a2b9"
  instance_type = "t3.micro"
  tags = {
    Name = "dev-instance"
  }
  depends_on = [ aws_s3_bucket.example]

}