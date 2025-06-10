#we are using different functions like count,element,length 

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "sudheertestforaws"
    key    = "test.tfstate"
    region = "us-east-1"
  }
}
resource "aws_vpc" "test_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_subnet" "test_subnet" {
  count             = length(var.subnet_cidr_block)
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = element(var.subnet_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.subnet_tag}-${count.index + 1}"
  }
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
