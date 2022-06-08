variable "dynamodb_table_name" {
  type        = string
  default     = null
  description = "The name of the table, this needs to be unique within a region."
}

variable "dynamodb_table_billing_mode" {
  type        = string
  default     = "PROVISIONED"
  description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are `PROVISIONED` and `PAY_PER_REQUEST`."
}

variable "dynamodb_table_read_capacity" {
  type        = string
  default     = null
  description = "The number of read units for this table. If the `billing_mode` is `PROVISIONED`, this field is required."
}

variable "dynamodb_table_write_capacity" {
  type        = string
  default     = null
  description = "The number of write units for this table. If the `billing_mode` is `PROVISIONED`, this field is required."
}

variable "dynamodb_table_hash_key" {
  type        = string
  default     = null
  description = "The attribute to use as the hash (partition) key. Must also be defined as an `attribute`."
}

variable "dynamodb_table_range_key" {
  type        = string
  default     = null
  description = "The attribute to use as the range (sort) key. Must also be defined as an `attribute`."
}

variable "dynamodb_table_server_side_encryption_enabled" {
  type        = string
  default     = "true"
  description = "Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)."
}

variable "dynamodb_table_server_side_encryption_key_arn" {
  type        = string
  default     = null
  description = "The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, `alias/aws/dynamodb`."
}

variable "dynamodb_table_attributes" {
  type = list(object({
    attribute_name : string,
    attribute_type : string
  }))
  default     = null
  description = "List of nested attribute definitions. Only required for `hash_key` and `range_key` attributes. Each attribute has two properties:"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "A map of tags to assign to the resource."
}

