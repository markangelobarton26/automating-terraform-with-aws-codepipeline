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

output "environment" {
  description = "Deployed environment"
  value       = var.environment
}

output "approval_status" {
  description = "Approval status for this deployment"
  value       = var.environment == "prod" ? "🚨 PRODUCTION - Manual approval required" : "✅ TEST - Auto-approved"
}

output "pipeline_features" {
  description = "Pipeline features demonstrated in Stage 4"
  value = [
    "✅ Environment-specific Parameter Store paths",
    "✅ Environment-specific Secrets Manager secrets",
    "✅ Manual approval workflow for production",
    "✅ Automated deployment for test",
    "✅ Environment validation and tagging",
    "✅ Visual distinction between environments"
  ]
}