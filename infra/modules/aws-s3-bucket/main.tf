/* ====================================================
 * AWS S3 bucket
 * ==================================================== */

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
  lower   = true
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
  depends_on              = [aws_s3_bucket.s3_bucket]
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket        = "${var.bucket_name}-${random_string.bucket_suffix.result}"
  acl           = var.bucket_acl
  policy        = var.bucket_policy
  force_destroy = var.bucket_force_destroy

  versioning {
    enabled = var.bucket_versioning_enabled
  }

  dynamic "server_side_encryption_configuration" {
    for_each = var.sse_key_id == "" ? [] : [1]
    content {
      dynamic "rule" {
        for_each = var.sse_key_id == "" ? [] : [1]
        content {
          dynamic "apply_server_side_encryption_by_default" {
            for_each = var.sse_key_id == "" ? [] : [1]
            content {
              kms_master_key_id = var.sse_key_id
              sse_algorithm     = var.sse_algorithm
            }
          }
        }
      }
    }
  }

  dynamic "logging" {
    for_each = var.bucket_logging_target_bucket == null ? [] : [1]

    content {
      target_bucket = var.bucket_logging_target_bucket
      target_prefix = coalesce(var.bucket_logging_target_prefix, var.bucket_name)
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.bucket_lifecycle_rule == null ? [] : var.bucket_lifecycle_rule

    content {
      enabled                                = lifecycle_rule.value.enabled
      prefix                                 = lookup(lifecycle_rule.value, "prefix", null)
      abort_incomplete_multipart_upload_days = lifecycle_rule.value.abort_incomplete_multipart_upload_days

      dynamic "transition" {
        for_each = lifecycle_rule.value.transition_inputs == null ? [] : lifecycle_rule.value.transition_inputs

        content {
          days          = transition.value.days
          storage_class = transition.value.storage_class
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = lifecycle_rule.value.noncurrent_version_transition_inputs == null ? [] : lifecycle_rule.value.noncurrent_version_transition_inputs

        content {
          days          = noncurrent_version_transition.value.days
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }

      dynamic "expiration" {
        for_each = lifecycle_rule.value.expiration_inputs == null ? [] : lifecycle_rule.value.expiration_inputs

        content {
          days = expiration.value.days
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = lifecycle_rule.value.noncurrent_version_expiration_inputs == null ? [] : lifecycle_rule.value.noncurrent_version_expiration_inputs

        content {
          days = noncurrent_version_expiration.value.days
        }
      }
    }
  }

  dynamic "replication_configuration" {
    for_each = var.bucket_replication_role == null ? [] : [1]
    content {
      role = var.bucket_replication_role
      dynamic "rules" {
        for_each = var.bucket_replication_rules
        content {
          id       = lookup(rules.value, "id", null)
          priority = lookup(rules.value, "priority", null)
          prefix   = lookup(rules.value, "prefix", null)
          status   = rules.value.status
          dynamic "destination" {
            for_each = [rules.value.destination]
            content {
              bucket             = destination.value.bucket
              storage_class      = lookup(destination.value, "storage_class", null)
              replica_kms_key_id = lookup(destination.value, "replica_kms_key_id", null)
              account_id         = lookup(destination.value, "account_id", null)
              dynamic "access_control_translation" {
                for_each = lookup(destination.value, "access_control_translation", null) == null ? [] : [destination.value.access_control_translation]
                content {
                  owner = access_control_translation.value.owner
                }
              }
            }
          }
          dynamic "source_selection_criteria" {
            for_each = lookup(rules.value, "source_selection_criteria", null) == null ? [] : [rules.value.source_selection_criteria]
            content {
              dynamic "sse_kms_encrypted_objects" {
                for_each = source_selection_criteria.value == null ? [] : [lookup(source_selection_criteria.value, "sse_kms_encrypted_objects", null)]
                content {
                  enabled = sse_kms_encrypted_objects.value.enabled
                }
              }
            }
          }
          dynamic "filter" {
            for_each = lookup(rules.value, "filter", null) == null ? [] : [rules.value.filter]
            content {
              prefix = lookup(filter.value, "prefix", null)
              tags   = lookup(filter.value, "tags", null)
            }
          }
        }
      }
    }
  }

  dynamic "website" {
    for_each = var.website_inputs == null ? [] : var.website_inputs

    content {
      index_document = website.value.index_document
      error_document = website.value.error_document
    }

  }

  tags = merge(tomap({ "Name" = var.bucket_name, "Product" = "S3 Bucket" }), var.tags)

}