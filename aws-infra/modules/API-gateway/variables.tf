variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "api_gw_conf" {
  description = "API Gateway configuration"
  type = object({
    name          = string
    protocol_type = string
  })
  default = {
    name          = "api-gw"
    protocol_type = "HTTP"
  }
}

variable "lambda_integration_route_premission" {
  description = "Lambda integration, route and permission configuration"
  type = object({
    lambda_invoke_arn                 = string
    lambda_func_name                  = string
    integration_type                  = string
    integration_method                = string
    connection_type                   = string
    route_key                         = string
    statement_id                      = string
    action                            = string
    principal                         = string
    authorizer_type                   = string
    authorizer_uri                    = string
    indentity_sources                 = set(string)
    authorizer_name                   = string
    authorizer_payload_format_version = string
  })
}



