resource "aws_instance" "web" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = "ap-south-1a"
  tags = {
    Name = "server-instance"
    env  = "qa"
    team = "devops"
  }
}

resource "aws_instance" "app" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = "ap-south-1a"
  tags = {
    Name = "server-instance"
    env  = "qa"
    team = "devops"
  }
}


#First run day5 s3 dynaomic backend code to create s3 bucket and dynamodb table for state management


#terraform plan -var-file=dev.tfvars

#terraform apply -var="instance_type=t3.micro"