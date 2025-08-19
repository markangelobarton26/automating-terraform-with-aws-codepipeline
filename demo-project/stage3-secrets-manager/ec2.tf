# EC2 instance with secrets integration
resource "aws_instance" "web_server" {
  ami           = data.aws_ssm_parameter.amazon_linux_ami.value
  instance_type = data.aws_ssm_parameter.instance_type.value
  
  vpc_security_group_ids = [aws_security_group.web.id]
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              
              cat > /var/www/html/index.html << 'HTML'
              <h1>Stage 3: Secrets Manager Integration</h1>
              <p><strong>AMI ID:</strong> ${data.aws_ssm_parameter.amazon_linux_ami.value} (from Parameter Store)</p>
              <p><strong>Instance Type:</strong> ${data.aws_ssm_parameter.instance_type.value} (from Parameter Store)</p>
              <p><strong>Region:</strong> ${var.aws_region}</p>
              <p><strong>API Key:</strong> ${local.api_credentials.api_key} (from Secrets Manager)</p>
              <p><strong>Service URL:</strong> ${local.api_credentials.service_url} (from Secrets Manager)</p>
              <hr>
              <h2>Security Improvements:</h2>
              <ul>
                <li>✅ API credentials in Secrets Manager</li>
                <li>✅ Automatic password rotation available</li>
                <li>✅ Encrypted at rest and in transit</li>
                <li>✅ Audit trail for secret access</li>
                <li>✅ Fine-grained IAM permissions</li>
                <li>✅ No secrets in Terraform state</li>
              </ul>
HTML
              EOF

  tags = {
    Name        = "demo-web-server-stage3"
    Environment = "demo"
    Stage       = "3-secrets-manager"
  }
}