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

output "security_issues" {
  description = "Security issues in this stage"
  value = [
    "Hardcoded AMI ID - won't work in all regions",
    "Security group open to 0.0.0.0/0 - security risk",
    "No encryption or secrets management",
    "Configuration not externalized"
  ]
}