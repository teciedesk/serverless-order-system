provider "aws" {
  region = var.aws_region
}

module "iam" {
  source                = "./modules/iam"
  codebuild_role_name   = "codebuild-role"
  replication_role_arn  = module.replication.replication_role_arn
  lambda_role_name      = "lambda-role"
}



module "dynamodb" {
  source      = "./modules/dynamodb"
  table_name  = "orders"
  environment = "dev"
}


module "sqs" {
  source            = "./modules/sqs"
  queue_name        = "order-processing-queue"
  visibility_timeout = 30
}


module "lambda" {
  source                      = "./modules/lambda"
  place_order_function_name   = "place-order-fn"
  authorizer_function_name    = "authorizer-fn"
  process_sqs_function_name   = "process-sqs-fn"
  lambda_role_arn             = module.iam.lambda_exec_role_arn
  dynamodb_table_name         = module.dynamodb.orders_table_name
}


module "api_gateway" {
  source = "./modules/api_gateway"

  api_name                      = "order-api"
  aws_region                   = var.aws_region
  stage_name                   = var.stage_name
  place_order_lambda_invoke_arn = module.lambda.place_order_lambda_invoke_arn
  authorizer_lambda_invoke_arn  = module.lambda.authorizer_lambda_invoke_arn
}


module "s3" {
  source      = "./modules/s3"
  bucket_name = "tecie-static-site-bucket"
  environment = "prod"
}

module "codepipeline" {
  source                = "./modules/codepipeline"
  pipeline_role_arn     = module.iam.pipeline_role_arn
  artifact_bucket       = module.s3.bucket_name
  repo_owner            = "TECIEDEVOPS"
  repo_name             = "serverless-order-system"
  repo_branch           = "main"
  github_token          = var.github_token
  codebuild_project_name = "order-system-build"
  lambda_function_name  = module.lambda.place_order_function_name
}

module "dr" {
  source = "./modules/dr"

  providers = {
    aws = aws.dr
  }

  source_bucket           = "your-source-bucket-name"
  destination_bucket_arn = "arn:aws:s3:::your-destination-bucket-name"
  replication_role_arn   = module.iam.replication_role_arn
  global_table_arn       = module.dynamodb.global_table_arn
}



