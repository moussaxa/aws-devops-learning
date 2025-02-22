resource "aws_s3_bucket" "Xavier-bucket" {
  bucket = "xavier123"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
