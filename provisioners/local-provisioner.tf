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

resource "aws_instance" "test" {
  ami                    = "ami-02457590d33d576c3"
  instance_type          = "t3.micro"
  key_name               = "test1"
  tags = {
    Name = "test"
  }

  provisioner "local-exec" {
   command = "touch hello.txt" 
   working_dir = "C:/Users/sudhe/Downloads"
  }

}