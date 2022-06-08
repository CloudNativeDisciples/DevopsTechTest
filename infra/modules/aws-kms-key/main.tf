/* ====================================================
 * AWS KMS KEY
 * ==================================================== */

resource "aws_kms_key" "kms_key" {
  description             = var.kms_key_description
  key_usage               = var.kms_key_usage
  policy                  = var.kms_key_policy
  deletion_window_in_days = var.kms_key_deletion_window_in_days
  is_enabled              = var.kms_key_deletion_is_enabled
  enable_key_rotation     = var.kms_key_enable_key_rotation
  tags                    = merge(tomap({ "Name" = var.kms_alias_name, "Product" = "KMS" }), var.tags)
}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/${var.kms_alias_name}"
  target_key_id = aws_kms_key.kms_key.key_id
  depends_on    = [aws_kms_key.kms_key]
}