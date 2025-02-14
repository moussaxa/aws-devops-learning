terraform {
  backend "s3" {
    bucket         = "aws-backend-test3"
    key            = "terraform.tfstate"
    region         = "us-east-1"
     dynamodb_table = "terraform-locks"
  }
}
