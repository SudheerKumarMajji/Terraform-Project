provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "test" {
  id = "vpc-058d93f9322868da6"
}


resource "aws_internet_gateway" "test_igw" {
  vpc_id = data.aws_vpc.test.id

  tags = {
    Name = "test_igw"
  }
}