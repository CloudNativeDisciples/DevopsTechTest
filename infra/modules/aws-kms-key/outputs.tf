output "kms_key_id" {
  value       = aws_kms_key.kms_key.key_id
  description = "The globally unique identifier for the key."
}

output "kms_key_arn" {
  value       = aws_kms_key.kms_key.arn
  description = "The Amazon Resource Name (ARN) of the key."
}

output "kms_alias_arn" {
  value       = aws_kms_alias.kms_alias.arn
  description = "The Amazon Resource Name (ARN) of the key alias."
}

output "kms_alias_target_key_arn" {
  value       = aws_kms_alias.kms_alias.target_key_arn
  description = "The Amazon Resource Name (ARN) of the target key identifier."
}