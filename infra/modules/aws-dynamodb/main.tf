/**
 * 
 * # Module AWS DynamoDB
 *  
 * 
 */


resource "aws_dynamodb_table" "dynamodb_table_provisionned" {
  count          = upper(var.dynamodb_table_billing_mode) == "PROVISIONED" ? 1 : 0
  name           = var.dynamodb_table_name
  billing_mode   = var.dynamodb_table_billing_mode
  read_capacity  = var.dynamodb_table_read_capacity
  write_capacity = var.dynamodb_table_write_capacity
  hash_key       = var.dynamodb_table_hash_key
  range_key      = var.dynamodb_table_range_key
  server_side_encryption {
    enabled     = var.dynamodb_table_server_side_encryption_enabled
    kms_key_arn = var.dynamodb_table_server_side_encryption_key_arn
  }
  dynamic "attribute" {
    for_each = var.dynamodb_table_attributes == null ? [] : var.dynamodb_table_attributes
    content {
      name = attribute.value.attribute_name
      type = attribute.value.attribute_type
    }
  }
  tags = merge(
    var.tags,
    tomap({
      "Name"    = var.dynamodb_table_name,
      "Product" = "DynamoDB Table"
      }
    )
  )
}

resource "aws_dynamodb_table" "dynamodb_table_on_demand" {
  count        = upper(var.dynamodb_table_billing_mode) == "PAY_PER_REQUEST" ? 1 : 0
  name         = var.dynamodb_table_name
  billing_mode = var.dynamodb_table_billing_mode
  hash_key     = var.dynamodb_table_hash_key
  range_key    = var.dynamodb_table_range_key
  server_side_encryption {
    enabled     = var.dynamodb_table_server_side_encryption_enabled
    kms_key_arn = var.dynamodb_table_server_side_encryption_key_arn
  }
  dynamic "attribute" {
    for_each = var.dynamodb_table_attributes == null ? [] : var.dynamodb_table_attributes
    content {
      name = attribute.value.attribute_name
      type = attribute.value.attribute_type
    }
  }
  tags = merge(
    var.tags,
    tomap({
      "Name"    = var.dynamodb_table_name,
      "Product" = "DynamoDB Table"
      }
    )
  )
}
