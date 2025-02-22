provider "aws" {
    region  = "us-east-1"
    profile = "default"
}
module "ec2" {
  source = "./modules/ec2"
}

module "s3" {
  source = "./modules/s3"
}
