output "s3_bucket_name" {
  value       = module.remote_state_bucket.s3_bucket_name
  description = "The name of the bucket."
}