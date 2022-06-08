data "aws_region" "current" {}

module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "0.17.0"

  stage = var.environment
  name  = "vpc"

  cidr_block = var.cidr_block
}

module "dynamic_subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "0.29.0"

  stage = var.environment
  name  = "subnet"

  vpc_id     = module.vpc.vpc_id
  igw_id     = module.vpc.igw_id
  cidr_block = var.cidr_block
  availability_zones = [
    "${data.aws_region.current.name}a",
    "${data.aws_region.current.name}b",
    "${data.aws_region.current.name}c",
  ]
}