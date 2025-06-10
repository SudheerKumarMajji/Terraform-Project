resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "_!%^"
}


resource "aws_secretsmanager_secret" "db_secret" {
  name = "password"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = random_password.db_password.result
}   

# resource "aws_db_instance" "example" {
#   instance_class    = "db.t3.micro"
#   allocated_storage = 64
#   engine            = "mysql"
#   username          = "admin"
#   password          = random_password.db_password.result
# }