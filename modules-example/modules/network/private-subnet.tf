resource "aws_subnet" "test_private_sn" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.private_cidr
  
  tags = {
    Name = "test_private_sn"
  }
}