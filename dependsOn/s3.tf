resource "aws_s3_bucket" "sudheertestforaws1" {
  bucket = "sudheertestforaws1"

  tags = {
    Name        = "My bucket1"
    Environment = "Dev"
  }

  depends_on = [ aws_instance.test ]
}

resource "aws_s3_bucket" "sudheertestforaws2" {
  bucket = "sudheertestforaws2"

  tags = {
    Name        = "My bucket2"
    Environment = "Dev"
  }

  depends_on = [ aws_s3_bucket.sudheertestforaws1 ]
}

resource "aws_s3_bucket" "sudheertestforaws3" {
  bucket = "sudheertestforaws3"

  tags = {
    Name        = "My bucket3"
    Environment = "Dev"
  }

  depends_on = [ aws_s3_bucket.sudheertestforaws2 ]
}