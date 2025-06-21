output "vpc_id" {
  value = aws_vpc.test_vpc.id
}

output "public_subnets" {
  value = aws_subnet.test_public_sn.id
}

output "private_subnets" {
  value = aws_subnet.test_private_sn.id
}