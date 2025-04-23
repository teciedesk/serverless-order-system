output "orders_table_name" {
  description = "The name of the DynamoDB orders table"
  value       = aws_dynamodb_table.orders.name
}

output "orders_table_arn" {
  description = "The ARN of the DynamoDB orders table"
  value       = aws_dynamodb_table.orders.arn
}

output "orders_table_stream_arn" {
  description = "The Stream ARN of the DynamoDB orders table"
  value       = aws_dynamodb_table.orders.stream_arn
}

output "table_name" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.orders.name
}
