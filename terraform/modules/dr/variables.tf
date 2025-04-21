variable "source_bucket" {
  description = "The name of the source S3 bucket"
  type        = string
}

variable "destination_bucket_arn" {
  description = "The ARN of the destination S3 bucket"
  type        = string
}

variable "replication_role_arn" {
  description = "IAM role ARN for replication"
  type        = string
}

variable "global_table_arn" {
  description = "ARN of the DynamoDB global table (primary)"
  type        = string
}

variable "dr_region" {
  description = "Disaster recovery region for DynamoDB replica"
  type        = string
  default     = "us-west-2"
}
