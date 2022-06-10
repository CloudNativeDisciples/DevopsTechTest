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
