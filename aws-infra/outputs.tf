output "lambda_arn" {
  description = "Lambda ARN-s and name"
  value       = module.lambda.lambda_arn
}

output "api_gateway_url" {
  description = "API gateway URL"
  value       = module.api_gateway.api_gateway_url
}
