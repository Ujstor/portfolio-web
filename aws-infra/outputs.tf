output "lambda_arn" {
  description = "Lambda ARN-s and name"
  value       = module.lambda.lambda_arn
}

# output "Dynamodb_arn" {
#   description = "DynamoDB ARN"
#   value       = module.dynamodb.dynamodb_arn
# }

output "api_gateway_url" {
  value = module.api_gateway.api_gateway_url
}
