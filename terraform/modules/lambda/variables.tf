variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "lambda_exec_role_arn" {
  description = "IAM Role ARN for Lambda"
  type        = string
}

variable "sqs_queue_url" {
  description = "URL of the SQS queue"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB orders table"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB orders table"
  type        = string
}

variable "dynamodb_stream_arn" {
  description = "The Stream ARN of the DynamoDB orders table"
  type        = string
}


variable "lambda_zip_path" {
  description = "Path to the zipped Lambda deployment package"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN of the SQS queue"
  type        = string
}
