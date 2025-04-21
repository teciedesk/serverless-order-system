output "place_order_lambda_arn" {
  value = aws_lambda_function.place_order.arn
}

output "authorizer_lambda_arn" {
  value = aws_lambda_function.authorizer.arn
}

output "process_sqs_lambda_arn" {
  value = aws_lambda_function.process_sqs.arn
}
