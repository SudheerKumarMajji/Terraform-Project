
resource "aws_instance" "public_instance" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.sg_id]
  subnet_id = var.public_subnets
  key_name               = "test1"
  associate_public_ip_address = true
  tags = {
    Name = "public_instance"
  }

user_data = <<-EOF
     #!/bin/bash
     touch hello.txt
     echo "helloworld remote provisioner" >> hello.txt
    #   sudo yum update
    #   sudo yum install nginx -y
    #   sudo yum install git -y
    #   git clone https://github.com/saikiranpi/SecOps-game.git
    #   rm -rf /var/www/html/index.nginx-debian.html
    #   cp  SecOps-game/index.html /var/www/html/index.html
    #  echo "<h1>This is public instance</h1>" >> /var/www/html/index.html
    #   sudo systemctl start nginx
    #   sudo systemctl enable nginx
 EOF

}