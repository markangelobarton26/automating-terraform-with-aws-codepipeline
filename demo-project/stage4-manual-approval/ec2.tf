# EC2 instance with environment-specific configuration
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
              
              # Environment-specific styling
              if [ "${var.environment}" = "prod" ]; then
                BGCOLOR="#ff6b6b"
                ENV_NAME="🚨 PRODUCTION 🚨"
                WARNING="⚠️ This is a production environment - handle with care!"
              else
                BGCOLOR="#4ecdc4"
                ENV_NAME="🧪 TEST"
                WARNING="✅ Safe to experiment in test environment"
              fi
              
              cat > /var/www/html/index.html << HTML
              <html>
              <head><title>Stage 4: ${var.environment} Environment</title></head>
              <body style="background-color: $BGCOLOR; font-family: Arial; padding: 20px;">
              <h1>Stage 4: Manual Approval Pipeline</h1>
              <h2>$ENV_NAME Environment</h2>
              <p style="font-size: 18px; font-weight: bold;">$WARNING</p>
              <hr>
              <p><strong>Environment:</strong> ${var.environment}</p>
              <p><strong>AMI ID:</strong> ${data.aws_ssm_parameter.amazon_linux_ami.value} (from Parameter Store)</p>
              <p><strong>Instance Type:</strong> ${data.aws_ssm_parameter.instance_type.value} (from Parameter Store)</p>
              <p><strong>Region:</strong> ${var.aws_region}</p>
              <p><strong>API Key:</strong> ${local.api_credentials.api_key} (from Secrets Manager)</p>
              <p><strong>Service URL:</strong> ${local.api_credentials.service_url} (from Secrets Manager)</p>
              <hr>
              <h2>Pipeline Features:</h2>
              <ul>
                <li>✅ Environment-specific configuration</li>
                <li>✅ Manual approval for production</li>
                <li>✅ Automated test deployment</li>
                <li>✅ Parameter Store integration</li>
                <li>✅ Secrets Manager integration</li>
                <li>✅ Environment validation</li>
              </ul>
              </body>
              </html>
HTML
              EOF

  tags = {
    Name        = "demo-web-server-${var.environment}"
    Environment = var.environment
    Stage       = "4-manual-approval"
    Approved    = var.environment == "prod" ? "manual-approval-required" : "auto-approved"
  }
}