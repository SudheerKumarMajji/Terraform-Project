
resource "aws_instance" "private_instance" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.sg_id]
  subnet_id = var.private_subnets
  key_name               = "test1"
  tags = {
    Name = "private_instance"
  }

user_data = <<-EOF
     #!/bin/bash
      sudo yum update
      sudo yum install nginx -y
      sudo yum install git -y
      git clone https://github.com/saikiranpi/SecOps-game.git
      rm -rf /var/www/html/index.nginx-debian.html
      cp  SecOps-game/index.html /var/www/html/index.html
     echo "<h1>This is private instance</h1>" >> /var/www/html/index.html
      sudo systemctl start nginx
      sudo systemctl enable nginx
 EOF
}