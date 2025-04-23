variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "Partition key name for the DynamoDB table"
  type        = string
  default     = "order_id"
}

variable "stream_enabled" {
  description = "Whether DynamoDB Streams are enabled"
  type        = bool
  default     = true
}

variable "stream_view_type" {
  description = "DynamoDB stream view type"
  type        = string
  default     = "NEW_IMAGE"
}

variable "environment" {
  description = "Deployment environment tag"
  type        = string
  default     = "dev"
}
