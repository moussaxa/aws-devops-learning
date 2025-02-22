resource "aws_s3_bucket" "Xavier-bucket" {
  bucket = "var.name"

  tags = {
    Name        = "var.name"
    Environment = "var.environment"
  }
}
