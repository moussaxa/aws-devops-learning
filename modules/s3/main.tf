resource "aws_s3_bucket" "xavier-bucket" {
  bucket = var.name

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}
