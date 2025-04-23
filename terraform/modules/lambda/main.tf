resource "aws_lambda_function" "order_handler" {
  function_name = "order-handler"
  role          = var.lambda_exec_role_arn
  handler       = "order-handler.lambda_handler"  # Make sure your function uses this format
  runtime       = "python3.12"
  filename      = "${path.module}/order-handler.zip"
  source_code_hash = filebase64sha256("${path.module}/order-handler.zip")

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.dynamodb_table_name
      SQS_QUEUE_URL       = var.sqs_queue_url
    }
  }
}

resource "aws_lambda_event_source_mapping" "sqs_event" {
  event_source_arn = var.sqs_queue_arn
  function_name    = aws_lambda_function.order_handler.arn
  batch_size       = 5
  enabled          = true
}
