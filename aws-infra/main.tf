module "lambda" {
  source = "./modules/lambda"

  # providers = {
  #   aws = aws.snadbox
  # }

  lambda_config = {
    work_dir          = "../"
    bin_name          = "bootstrap"
    archive_bin_name  = "function.zip"
    function_name     = "portfolio-web"
    handler           = "main"
    runtime           = "provided.al2023"
    ephemeral_storage = "512"
    archive_type      = "zip"
  }
}

module "api_gateway" {
  source = "./modules/API-gateway"

  # providers = {
  #   aws = aws.snadbox
  # }

  api_gw_conf = {
    name          = "portfolio-web"
    protocol_type = "HTTP"
  }

  lambda_integration_route_premission = {
    lambda_invoke_arn                 = module.lambda.lambda_arn.invoke_arn
    lambda_func_name                  = module.lambda.lambda_arn.lambda_name
    integration_type                  = "AWS_PROXY"
    integration_method                = "POST"
    connection_type                   = "INTERNET"
    route_key                         = "GET /{proxy+}"
    statement_id                      = "AllowExecutionFromAPIGateway"
    action                            = "lambda:InvokeFunction"
    principal                         = "apigateway.amazonaws.com"
    authorizer_type                   = "REQUEST"
    authorizer_uri                    = module.lambda.lambda_arn.invoke_arn
    indentity_sources                 = ["$request.header.Authorization"]
    authorizer_name                   = "example-authorizer"
    authorizer_payload_format_version = "1.0"
  }
}
