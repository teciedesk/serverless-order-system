variable "bucket_name" {
  type        = string
  description = "S3 bucket name for static website"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment tag"
}
