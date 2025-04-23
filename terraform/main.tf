module "iam" {
  source              = "./modules/iam"
  lambda_role_name    = "order-lambda-role"
  codebuild_role_name = "order-codebuild-role"
  dynamodb_table_arn  = module.dynamodb.orders_table_arn
  sqs_queue_arn       = module.sqs.queue_arn
}

module "dynamodb" {
  source      = "./modules/dynamodb"
  table_name  = "orders"
  hash_key    = "order_id"
  environment = var.environment
}

module "sqs" {
  source                      = "./modules/sqs"
  queue_name                  = "order-processing-queue"
  visibility_timeout_seconds  = 30
  message_retention_seconds   = 345600
  enable_dlq                  = true
  max_receive_count           = 5
}

output "sqs_queue_url" {
  value = module.sqs.queue_url
}

output "sqs_queue_arn" {
  value = module.sqs.queue_arn
}

output "lambda_exec_role_arn" {
  value = module.iam.lambda_exec_role_arn
}

output "codebuild_role_arn" {
  value = module.iam.codebuild_role_arn
}

module "lambda" {
  source                  = "./modules/lambda"
  function_name           = "order-handler"
  lambda_exec_role_arn    = module.iam.lambda_exec_role_arn
  sqs_queue_url           = module.sqs.queue_url
  dynamodb_table_name     = module.dynamodb.table_name
  lambda_zip_path         = "${path.module}/modules/lambda/order-handler.zip"
  dynamodb_table_arn      = module.dynamodb.orders_table_arn
  dynamodb_stream_arn     = module.dynamodb.orders_table_stream_arn
  sqs_queue_arn = module.sqs.queue_arn

}



