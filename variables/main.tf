provider "aws" {
  region = var.region
}

resource "aws_vpc" "test_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_tag
  }
}


resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = var.igw_tag
  }
}

resource "aws_subnet" "test_subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.subnet_cidr_block
  tags = {
    Name = var.subnet_tag
  }
}


resource "aws_route_table" "test_routeTable" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = var.rt_cidr
    gateway_id = aws_internet_gateway.test_igw.id
  }

  tags = {
    Name = "test_routeTable"
  }
}

resource "aws_route_table_association" "test_routeAssociation" {
  subnet_id      = aws_subnet.test_subnet.id
  route_table_id = aws_route_table.test_routeTable.id
}

resource "aws_security_group" "allow_all" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.test_vpc.id


  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "allow_all"
  }
}

resource "aws_instance" "test" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.test_subnet.id
  tags = {
    Name = var.ec2_tag
  }
}