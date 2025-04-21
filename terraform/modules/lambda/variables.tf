variable "place_order_function_name" {
  type        = string
  description = "Name of the place order Lambda function"
}

variable "authorizer_function_name" {
  type        = string
  description = "Name of the Lambda authorizer function"
}

variable "process_sqs_function_name" {
  type        = string
  description = "Name of the SQS processing Lambda function"
}

variable "lambda_role_arn" {
  type        = string
  description = "IAM Role ARN for Lambda functions"
}

variable "dynamodb_table_name" {
  type        = string
  description = "DynamoDB table name for placing orders"
}
