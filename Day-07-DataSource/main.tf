data "aws_subnet" "selected" {
    filter {
      name ="tag:Name"
      values= ["test"]
    }
  
}

data "aws_security_groups" "selected" {
    filter {
      name ="tag:Name"
      values= ["my_sg"]
    }
  
}



resource "aws_instance" "dev" {
  ami           = "ami-0e38835daf6b8a2b9"
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.selected.id
  vpc_security_group_ids = data.aws_security_groups.selected.ids
  tags = {
    Name = "jenkins"
  }
}