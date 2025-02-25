provider "aws" {
    region  = "us-east-1"
    profile = "default"
}
module "ec2" {
  source = "./modules/ec2"
  name = "xavier-ec2"
}

module "s3" {
  source = "./modules/s3"
  name = "xavier-s3-bucket-test"
}
