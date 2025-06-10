data "aws_secretsmanager_secret" "db_secret" {

name = "password"
}

data "aws_secretsmanager_secret_version" "secret_version" {

secret_id = data.aws_secretsmanager_secret.db_secret.id
}


resource "aws_db_instance" "test_db" {
  identifier = "prod-db"
  allocated_storage    = 10
  db_name              = "proddb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = data.aws_secretsmanager_secret_version.secret_version.secret_string
  publicly_accessible = true
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}


