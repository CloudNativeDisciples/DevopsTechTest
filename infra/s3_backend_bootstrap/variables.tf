variable "aws_profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "shared_credentials_file" {
  type = string
}

variable "environment" {
  type        = string
  description = "environment name"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "A map of tags to assign to the resource."
}

locals {
  terraform_remote_state_kms_key_name        = "sportbuff-${var.environment}-kmskey"
  terraform_remote_state_s3_bucket_name      = "sportbuff-${var.environment}-s3b"
  terraform_remote_state_dynamodb_table_name = "sportbuff-${var.environment}-ddbtable"
}
