variable "lambda_role_name" {
  type        = string
  #description = "IAM role name for Lambda"
}

variable "codebuild_role_name" {
  type        = string
  #description = "IAM role name for CodeBuild"
}

variable "replication_role_arn" {
  type        = string
}

#variable "global_table_arn" {
  #type        = string
#}
