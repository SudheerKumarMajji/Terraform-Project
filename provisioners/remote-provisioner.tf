provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "sudheertestforaws"
    key    = "test.tfstate"
    region = "us-east-1"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
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
  ami                    = "ami-02457590d33d576c3"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  key_name               = "test1"
  tags = {
    Name = "test"
  }

  provisioner "remote-exec" {
    
    inline = [ 
        "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
     ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("C:/Users/sudhe/Downloads/test1.pem")
    timeout     = "3m"
  }
}