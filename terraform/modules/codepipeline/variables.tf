variable "pipeline_role_arn" {
  description = "IAM Role ARN for CodePipeline"
  type        = string
}

variable "artifact_bucket" {
  description = "S3 bucket for storing artifacts"
  type        = string
}

variable "repo_owner" {
  description = "GitHub repo owner"
  type        = string
}

variable "repo_name" {
  description = "GitHub repository name"
  type        = string
}

variable "repo_branch" {
  description = "GitHub branch to use"
  type        = string
  default     = "main"
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "codebuild_project_name" {
  description = "CodeBuild project name"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of Lambda function to invoke after build"
  type        = string
}
