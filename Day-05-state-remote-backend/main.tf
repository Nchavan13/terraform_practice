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


#First run day5 s3 dynaomic backend code to create s3 bucket and dynamodb table for state management


#terraform plan -var-file=dev.tfvars

#terraform apply -var="instance_type=t3.micro"