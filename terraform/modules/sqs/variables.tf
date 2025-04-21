variable "queue_name" {
  type        = string
  description = "Name of the main SQS queue"
}

variable "visibility_timeout" {
  type        = number
  default     = 30
  description = "Visibility timeout in seconds"
}
