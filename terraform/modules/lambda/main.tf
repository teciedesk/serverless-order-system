resource "aws_lambda_function" "place_order" {
  function_name = var.place_order_function_name
  role          = var.lambda_role_arn
  handler       = "place_order.handler"
  runtime       = "nodejs18.x"
  timeout       = 10
  filename      = "${path.module}/../../src/lambdas/place_order.zip"

  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table_name
    }
  }
}

resource "aws_lambda_function" "authorizer" {
  function_name = var.authorizer_function_name
  role          = var.lambda_role_arn
  handler       = "authorizer.handler"
  runtime       = "nodejs18.x"
  timeout       = 5
  filename      = "${path.module}/../../src/lambdas/authorizer.zip"
}

resource "aws_lambda_function" "process_sqs" {
  function_name = var.process_sqs_function_name
  role          = var.lambda_role_arn
  handler       = "process_sqs.handler"
  runtime       = "nodejs18.x"
  timeout       = 10
  filename      = "${path.module}/../../src/lambdas/process_sqs.zip"
}
