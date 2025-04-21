output "api_id" {
  value = aws_api_gateway_rest_api.orders_api.id
}

output "invoke_url" {
  value = "https://${aws_api_gateway_rest_api.orders_api.id}.execute-api.${var.aws_region}.amazonaws.com/${var.stage_name}"
}
