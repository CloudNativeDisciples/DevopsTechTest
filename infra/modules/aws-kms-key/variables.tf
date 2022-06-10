variable "kms_key_description" {
  type        = string
  default     = null
  description = "The description of the key as viewed in AWS console."
}

variable "kms_key_usage" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  description = "Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT` or `SIGN_VERIFY`."
}

variable "kms_key_policy" {
  type        = string
  default     = null
  description = "A valid policy JSON document. For more information about building AWS IAM policy documents with Terraform, see the [AWS IAM Policy Document Guide](https://learn.hashicorp.com/terraform/aws/iam-policy)."
}

variable "kms_key_deletion_window_in_days" {
  type        = string
  default     = "30"
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days."
}

variable "kms_key_deletion_is_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the key is enabled."
}

variable "kms_key_enable_key_rotation" {
  type        = bool
  default     = true
  description = "Specifies whether [key rotation](http://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html) is enabled."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "A map of tags to assign to the resource."
}

variable "kms_alias_name" {
  type        = string
  default     = null
  description = "The display name of the alias and the Name tag value for the Key."
}