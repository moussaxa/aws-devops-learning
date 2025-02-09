provider "aws" {
    region  = "us-east-1"
    profile = "Xavier"
}

resource "aws_s3_bucket" "Xavier-bucket" {
  bucket = "xavier123"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
