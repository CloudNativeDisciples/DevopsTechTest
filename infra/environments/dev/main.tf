module "network" {
  source = "../../modules/aws-vpc"

  cidr_block  = "10.3.0.0/16"
  environment = var.environment
}

