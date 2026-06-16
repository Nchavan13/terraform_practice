data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# calling Custom AMI 

data "aws_ami" "custom" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["custom-ami-*"]
  }
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.amzlinux.id
  instance_type = "t3.micro"
  tags = {
    Name = "jenkins"
  }
}


