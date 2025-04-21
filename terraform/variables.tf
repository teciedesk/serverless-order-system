variable "aws_region" {
  default = "us-east-1"
}

variable "github_token" {
  description = "GitHub token for CodePipeline"
  type        = string
  sensitive   = true
}

variable "stage_name" {
  description = "Stage name for API Gateway"
  type        = string
  default     = "dev" # or "prod" based on your setup
}


variable "dr_region" {
  description = "Disaster Recovery region for DynamoDB replica"
  type        = string
  default     = "us-west-2" # or your DR region
}