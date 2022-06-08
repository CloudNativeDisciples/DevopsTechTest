output "s3_bucket_policy" {
  value       = aws_s3_bucket_policy.s3_bucket_policy.policy
  description = "The text of the policy. For more information about building AWS IAM policy documents with Terraform, see the [AWS IAM Policy Document Guide](https://learn.hashicorp.com/terraform/aws/iam-policy)."
}
