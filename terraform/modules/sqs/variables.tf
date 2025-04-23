variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout in seconds"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "How long to retain messages (seconds)"
  type        = number
  default     = 345600  # 4 days
}

variable "enable_dlq" {
  description = "Whether to create and configure a dead‑letter queue"
  type        = bool
  default     = true
}

variable "max_receive_count" {
  description = "How many receives before sending to DLQ"
  type        = number
  default     = 5
}
