module "terraform_remote_state" {
  source                      = "../modules/aws-terraform-remote-state"
  tfstate_bucket_name         = local.terraform_remote_state_s3_bucket_name
  tfstate_kms_key_name        = local.terraform_remote_state_kms_key_name
  tfstate_dynamodb_table_name = local.terraform_remote_state_dynamodb_table_name
  tags                        = var.tags
}
