# Creating VPC

resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "prod-vpc"
  }
}


# Creating Subnet

resource "aws_subnet" "prod" {
  vpc_id     = aws_vpc.prod.id
  cidr_block = "10.0.0.0/18"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.prod.id
  cidr_block = "10.0.64.0/18"
  tags = {
    Name = "private-subnet"
  }
}

# Creating Internet Gateway
resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.prod.id
  tags = {
    Name = "prod-igw"
  }
}

# Creating Route Table and Route
resource "aws_route_table" "prod" {
  vpc_id = aws_vpc.prod.id
  tags = {
    Name = "prod-rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod.id
  }
}


# Associating Route Table with Subnet

resource "aws_route_table_association" "prod" {
  subnet_id      = aws_subnet.prod.id
  route_table_id = aws_route_table.prod.id
}


#creating Nat Gateway for private subnet
#create route for private subnet to access internet via nat gateway
#route table association for private subnet with new route table having nat gateway as default route

# EIP for Nat Gateway

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# NAT

resource "aws_nat_gateway" "prod" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.prod.id
  tags = {
    Name = "prod-nat-gateway"
  }
  depends_on = [aws_internet_gateway.prod]

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.prod.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.prod.id
  }

  tags = {
    Name = "private-route-table"
  }
}

# Creating Security Group
resource "aws_security_group" "prod" {
  name        = "prod-sg"
  description = "Production security group"
  vpc_id      = aws_vpc.prod.id

  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#creating EC2 Instance

resource "aws_instance" "prod" {
  ami             = "ami-0e38835daf6b8a2b9"
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.prod.id
  key_name        = "my-key"
  security_groups = [aws_security_group.prod.id]

  tags = {
    Name = "prod-instance"
  }
}
