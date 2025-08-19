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

output "ami_used" {
  description = "AMI ID retrieved from Parameter Store"
  value       = data.aws_ssm_parameter.amazon_linux_ami.value
}

output "instance_type_used" {
  description = "Instance type retrieved from Parameter Store"
  value       = data.aws_ssm_parameter.instance_type.value
}

output "security_improvements" {
  description = "Security improvements in this stage"
  value = [
    "AMI ID dynamically retrieved - works in any region",
    "Instance type externalized - easy to change",
    "CIDR blocks configurable - better security",
    "Configuration centralized in Parameter Store"
  ]
}

output "remaining_issues" {
  description = "Security issues still to address"
  value = [
    "No secrets management for sensitive data",
    "Database passwords would still be in plain text",
    "API keys and certificates not securely handled"
  ]
}