resource "aws_instance" "test" {
  ami           = "ami-0953476d60561c955"
  instance_type = "t3.micro"

  tags = {
    Name = "test"
  }
}