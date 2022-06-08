variable "bucket_id" {
  type        = string
  description = "The name of the bucket to which to apply the policy."
}

variable "bucket_policy" {
  type        = string
  description = "The text of the policy. For more information about building AWS IAM policy documents with Terraform, see the [AWS IAM Policy Document Guide](https://learn.hashicorp.com/terraform/aws/iam-policy)."
}
