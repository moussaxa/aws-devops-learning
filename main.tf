provider "aws" {
    region  = "us-east-1"
    profile = "default"
}
locals {
  name = "xavier"
}
module "ec2" {
  source = "./modules/ec2"
  name = "${local.name}"
  }

module "s3" {
  source = "./modules/s3"
  name = "${local.name}"
  }
  
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.name}"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.name}"

  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = ["sg-0a75e249fda05175e"]
  subnet_id              = "subnet-0ed0ff68f1c8add88"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Hello, Terraform!'"
  }
}
