resource "aws_s3_bucket" "xavier-bucket" {
  bucket = var.name

  tags = {
    Name        = join("-",["xavier","bucket","testing"])
    Environment = var.environment
  }
}
