variable "bucket_name" {
  description = "The name of the bucket"
}

variable "bucket_policy" {
  type        = string
  default     = null
  description = "A valid [bucket policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html) JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a `terraform plan`. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the [AWS IAM Policy Document Guide](https://learn.hashicorp.com/terraform/aws/iam-policy)."
}

variable "bucket_acl" {
  type        = string
  default     = "private"
  description = "The [canned ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl) to apply. Conflicts with `grant`."
}

variable "bucket_force_destroy" {
  type        = bool
  default     = false
  description = "A boolean that indicates all objects (including any [locked objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock-overview.html)) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are *not* recoverable."
}

variable "sse_key_id" {
  type        = string
  default     = null
  description = "The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of `sse_algorithm` as `aws:kms`. The default `aws/s3` AWS KMS master key is used if this element is absent while the `sse_algorithm` is `aws:kms`."
}

variable "sse_algorithm" {
  type        = string
  default     = "aws:kms"
  description = "The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`"
}

variable "bucket_versioning_enabled" {
  type        = string
  default     = "true"
  description = "Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket."
}

variable "bucket_logging_target_bucket" {
  type        = string
  default     = null
  description = "The name of the bucket that will receive the log objects."
}

variable "bucket_logging_target_prefix" {
  type        = string
  default     = null
  description = "To specify a key prefix for log objects."
}

variable "bucket_lifecycle_rule" {
  type        = list(any)
  default     = null
  description = "A configuration of [object lifecycle management](http://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html), as documented [here](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html#lifecycle_rule)."
}

variable "bucket_replication_role" {
  type        = string
  default     = null
  description = "The ARN of the IAM role for Amazon S3 to assume when replicating the objects."
}

variable "bucket_replication_rules" {
  type        = list(any)
  default     = null
  description = "Specifies the rules managing the replication (documented [here](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html#argument-reference))."
}

variable "bucket_name_add_region_suffix" {
  type        = bool
  default     = true
  description = "Whether to add or not the region trigram as a suffix to the bucket name."
}

variable "block_public_acls" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should block public ACLs for this bucket."
}
variable "block_public_policy" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should block public bucket policies for this bucket."

}
variable "ignore_public_acls" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."

}
variable "restrict_public_buckets" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."

}
variable "website_inputs" {
  type        = list(any)
  default     = null
  description = "Specifies the website configutation."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "A map of tags to assign to the resource."
}