
module "kms_key" {
  source              = "../aws-kms-key"
  kms_alias_name      = var.tfstate_kms_key_name
  kms_key_description = "This key is used to encrypt tfstate S3 bucket"
  tags                = var.tags
}


module "remote_state_bucket" {
  source      = "../aws-s3-bucket"
  bucket_name = var.tfstate_bucket_name
  sse_key_id  = module.kms_key.kms_key_arn
  tags        = var.tags
}

module "remote_state_bucket_policy" {
  source        = "../aws-s3-bucket-policy"
  bucket_id     = module.remote_state_bucket.s3_bucket_id
  bucket_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
			"Sid": "DenyUnSecureCommunications",
			"Effect": "Deny",
			"Principal": {
				"AWS": "*"
			},
			"Action": "s3:*",
			"Resource": "${module.remote_state_bucket.s3_bucket_arn}/*",
			"Condition": {
				"Bool": {
					"aws:SecureTransport": "false"
				}
			}
		}
  ]
}
POLICY
}

module "remote_state_locking_table" {
  source                      = "../aws-dynamodb"
  dynamodb_table_name         = var.tfstate_dynamodb_table_name
  dynamodb_table_billing_mode = "PAY_PER_REQUEST"
  dynamodb_table_hash_key     = "LockID"
  dynamodb_table_attributes = [{
    attribute_name = "LockID"
    attribute_type = "S"
  }]
  tags = var.tags
}


