variable "api_name" {
  type        = string
  description = "Name of the API"
}

variable "stage_name" {
  type        = string
  default     = "dev"
}

variable "place_order_lambda_invoke_arn" {
  type        = string
  description = "Invoke ARN for the place_order Lambda"
}

variable "authorizer_lambda_invoke_arn" {
  type        = string
  description = "Invoke ARN for the Lambda authorizer"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
