output "lambda_role_arn" {
  value = aws_iam_role.lambda_exec.arn
}

output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
}


output "pipeline_role_arn" {
  value = aws_iam_role.pipeline.arn
}

output "replication_role_arn" {
  value = aws_iam_role.dynamodb_replication.arn
}

output "global_table_arn" {
  value = aws_dynamodb_table.global_table.arn
}
