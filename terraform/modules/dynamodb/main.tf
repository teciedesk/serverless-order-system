resource "aws_dynamodb_table" "orders" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "order_id"
  stream_enabled = true
  stream_view_type = "NEW_IMAGE"

  attribute {
    name = "order_id"
    type = "S"
  }

  tags = {
    Name        = var.table_name
    Environment = var.environment
  }
}

#replica {
  #region_name = var.dr_region
#}
