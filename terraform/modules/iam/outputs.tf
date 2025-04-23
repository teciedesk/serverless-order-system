output "lambda_exec_role_arn" {
  description = "ARN of the Lambda execution role"
  value       = aws_iam_role.lambda_exec.arn
}

output "codebuild_role_arn" {
  description = "ARN of the CodeBuild service role"
  value       = aws_iam_role.codebuild.arn
}

output "lambda_dynamodb_policy_arn" {
  value = aws_iam_policy.lambda_dynamodb_policy.arn
}
