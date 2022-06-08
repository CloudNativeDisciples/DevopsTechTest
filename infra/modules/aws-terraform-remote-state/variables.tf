/* ====================================================
 *  Variable definition for Terraform Remote State
 * ==================================================== */

variable "tfstate_kms_key_name" {
  type        = string
  description = "Terraform Remote State KMS Key Name."
}

variable "tfstate_bucket_name" {
  type        = string
  description = "Terraform Remote State S3 Bucket Name."
}

variable "tfstate_dynamodb_table_name" {
  type        = string
  description = "Terraform Remote State Dynamodb Table Name."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "A map of tags to assign to the resource."
}