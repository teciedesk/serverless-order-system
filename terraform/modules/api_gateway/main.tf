resource "aws_api_gateway_rest_api" "orders_api" {
  name        = var.api_name
  description = "API Gateway for serverless order system"
}

resource "aws_api_gateway_resource" "orders" {
  rest_api_id = aws_api_gateway_rest_api.orders_api.id
  parent_id   = aws_api_gateway_rest_api.orders_api.root_resource_id
  path_part   = "orders"
}

resource "aws_api_gateway_method" "orders_post" {
  rest_api_id   = aws_api_gateway_rest_api.orders_api.id
  resource_id   = aws_api_gateway_resource.orders.id
  http_method   = "POST"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_auth.id
}

resource "aws_api_gateway_integration" "post_integration" {
  rest_api_id = aws_api_gateway_rest_api.orders_api.id
  resource_id = aws_api_gateway_resource.orders.id
  http_method = aws_api_gateway_method.orders_post.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.place_order_lambda_invoke_arn
}

resource "aws_api_gateway_authorizer" "lambda_auth" {
  name                    = "lambda-authorizer"
  rest_api_id             = aws_api_gateway_rest_api.orders_api.id
  authorizer_uri          = var.authorizer_lambda_invoke_arn
  authorizer_result_ttl_in_seconds = 300
  type                    = "TOKEN"
  identity_source         = "method.request.header.Authorization"
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [aws_api_gateway_integration.post_integration]
  rest_api_id = aws_api_gateway_rest_api.orders_api.id
  stage_name  = var.stage_name
}
