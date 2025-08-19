output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web_server.id
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.web_server.public_ip
}

output "web_url" {
  description = "URL to access the web server"
  value       = "http://${aws_instance.web_server.public_ip}"
}

output "api_secret_name" {
  description = "Name of the API secret in Secrets Manager"
  value       = data.aws_secretsmanager_secret.api_key.name
}

output "security_achievements" {
  description = "Security achievements in this final stage"
  value = [
    "✅ API credentials stored in Secrets Manager",
    "✅ Secrets encrypted at rest and in transit", 
    "✅ Automatic rotation capability enabled",
    "✅ Fine-grained IAM access control",
    "✅ Audit trail for all secret access",
    "✅ No secrets in Terraform state or code",
    "✅ Configuration externalized via Parameter Store",
    "✅ Secure secret retrieval at runtime"
  ]
}

output "cost_considerations" {
  description = "Cost implications of security improvements"
  value = [
    "Parameter Store: Free for standard parameters",
    "Secrets Manager: ~$0.40/month per secret + API calls",
    "EC2: ~$8-10/month for t2.micro",
    "Security ROI: Prevents costly security breaches"
  ]
}