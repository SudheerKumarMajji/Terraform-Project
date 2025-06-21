resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_gw.id
  }


  tags = {
    Name = "public_rt"
  }
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.test_vpc.id

  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.test_gw.id
  # }


  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.test_public_sn.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.test_private_sn.id
  route_table_id = aws_route_table.private_rt.id
}