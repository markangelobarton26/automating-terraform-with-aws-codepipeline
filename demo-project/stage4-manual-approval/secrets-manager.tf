# Get API key from Secrets Manager (environment-specific)
data "aws_secretsmanager_secret" "api_key" {
  name = "demo/${var.environment}/api-key"
}

data "aws_secretsmanager_secret_version" "api_key" {
  secret_id = data.aws_secretsmanager_secret.api_key.id
}

locals {
  api_credentials = jsondecode(data.aws_secretsmanager_secret_version.api_key.secret_string)
}