output "dynamodb_table_provisionned_arn" {
  value = upper(var.dynamodb_table_billing_mode) == "PROVISIONED" ? aws_dynamodb_table.dynamodb_table_provisionned.0.arn : null
}
output "dynamodb_table_provisionned_id" {
  value = upper(var.dynamodb_table_billing_mode) == "PROVISIONED" ? aws_dynamodb_table.dynamodb_table_provisionned.0.id : null
}
output "dynamodb_table_on_demand_name" {
  value = upper(var.dynamodb_table_billing_mode) == "PAY_PER_REQUEST" ? aws_dynamodb_table.dynamodb_table_on_demand.0.name : null
}
output "dynamodb_table_on_demand_arn" {
  value = upper(var.dynamodb_table_billing_mode) == "PAY_PER_REQUEST" ? aws_dynamodb_table.dynamodb_table_on_demand.0.arn : null
}
output "dynamodb_table_on_demand_id" {
  value = upper(var.dynamodb_table_billing_mode) == "PAY_PER_REQUEST" ? aws_dynamodb_table.dynamodb_table_on_demand.0.id : null
}
