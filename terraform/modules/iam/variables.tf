variable "lambda_role_name" {
  description = "Name for the Lambda execution role"
  type        = string
}

variable "codebuild_role_name" {
  description = "Name for the CodeBuild service role"
  type        = string
}

variable "dynamodb_table_arn" {
  type        = string
  description = "DynamoDB table ARN for Lambda policy"
}

variable "sqs_queue_arn" {
  description = "ARN of the SQS queue Lambda needs access to"
  type        = string
}
