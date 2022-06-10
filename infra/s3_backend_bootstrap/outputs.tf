output "s3_bucket_name" {
  value       = module.terraform_remote_state.s3_bucket_name
  description = "The name of the bucket."
}
