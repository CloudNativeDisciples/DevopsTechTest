terraform {
  required_version = "~> 1.1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile                  = var.aws_profile
  region                   = var.aws_region
  shared_credentials_files = [var.shared_credentials_file]
}
