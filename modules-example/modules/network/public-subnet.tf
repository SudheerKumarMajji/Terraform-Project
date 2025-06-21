resource "aws_subnet" "test_public_sn" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.public_cidr
  
  tags = {
    Name = "test_public_sn"
  }
}