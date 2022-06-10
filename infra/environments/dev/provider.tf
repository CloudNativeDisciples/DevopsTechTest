terraform {
  required_version = "~> 0.13.0"
  backend "s3" {
    profile        = "sportbuff-tech-task"
    bucket         = "sportbuff-dev-s3b-5i3bd189" //Get the bucket name from s3_backend_bootstrap output.
    dynamodb_table = "sportbuff-dev-ddbtable"
    key            = "sportbuff-dev.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}

provider "aws" {
  profile                 = var.aws_profile
  region                  = var.aws_region
  shared_credentials_file = var.shared_credentials_file
}

