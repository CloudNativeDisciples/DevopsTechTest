output "s3_bucket_id" {
  value       = aws_s3_bucket_public_access_block.bucket_public_access_block.id
  description = "The name of the bucket."
}
output "s3_bucket_public_access_block_id" {
  value       = aws_s3_bucket_public_access_block.bucket_public_access_block.id
  description = "Name of the S3 bucket the public access block configuration is attached to"
}
output "s3_bucket_arn" {
  value       = aws_s3_bucket.s3_bucket.arn
  description = "The ARN of the bucket. Will be of format `arn:aws:s3:::bucketname`."
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.s3_bucket.bucket
  description = "The name of the bucket."
}

output "s3_bucket_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_domain_name
}