resource "aws_instance" "name" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}


#terraform plan -var-file=dev.tfvars

#terraform apply -var="instance_type=t3.micro"