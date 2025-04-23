resource "aws_dynamodb_table" "orders" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key
  stream_enabled = var.stream_enabled
  stream_view_type = var.stream_view_type

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = {
    Environment = var.environment
    Name        = var.table_name
  }
}
