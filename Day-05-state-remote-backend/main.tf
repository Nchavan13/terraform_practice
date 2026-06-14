resource "aws_instance" "name" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = "ap-south-1a"
  tags = {
    Name = "MyInstance"
    env  = "dev"
    team = "devops"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "niltech1010101010"
  tags = {
    Name = "MyBucket"
    env  = "dev"
    team = "devops"
  }
}




#terraform plan -var-file=dev.tfvars

#terraform apply -var="instance_type=t3.micro"