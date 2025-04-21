output "orders_table_name" {
  value = aws_dynamodb_table.orders.name
}

output "orders_table_arn" {
  value = aws_dynamodb_table.orders.arn
}

output "orders_table_stream_arn" {
  value = aws_dynamodb_table.orders.stream_arn
}

output "global_table_arn" {
  value = aws_dynamodb_table.orders.arn
}
