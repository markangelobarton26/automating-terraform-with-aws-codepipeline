# Parameter Store parameters for demo
resource "aws_ssm_parameter" "instance_type" {
  name  = "/demo/ec2/instance-type"
  type  = "String"
  value = "t2.micro"
  
  tags = {
    Name = "Demo Instance Type"
  }
}

resource "aws_ssm_parameter" "allowed_cidr" {
  name  = "/demo/security/allowed-cidr"
  type  = "String"
  value = "0.0.0.0/0"  # Change this to your IP/32 for better security
  
  tags = {
    Name = "Demo Allowed CIDR"
  }
}

resource "aws_ssm_parameter" "amazon_linux_ami" {
  name  = "/demo/ec2/ami-id"
  type  = "String"
  value = "ami-0779c82fbb81e731c"
  
  tags = {
    Name = "Demo Amazon Linux AMI"
  }
}

# Secrets Manager secret for demo
resource "aws_secretsmanager_secret" "api_key" {
  name        = "demo/app/api-key"
  description = "Demo API credentials for Stage 3"
}

resource "aws_secretsmanager_secret_version" "api_key" {
  secret_id = aws_secretsmanager_secret.api_key.id
  secret_string = jsonencode({
    api_key     = "demo123456"
    service_url = "https://api.example.com"
  })
}

# Stage 4 environment-specific parameters
resource "aws_ssm_parameter" "test_instance_type" {
  name  = "/demo/test/ec2/instance-type"
  type  = "String"
  value = "t2.micro"
  
  tags = {
    Name = "Demo Test Instance Type"
  }
}

resource "aws_ssm_parameter" "prod_instance_type" {
  name  = "/demo/prod/ec2/instance-type"
  type  = "String"
  value = "t2.small"
  
  tags = {
    Name = "Demo Prod Instance Type"
  }
}

# Stage 4 environment-specific secrets
resource "aws_secretsmanager_secret" "test_api_key" {
  name        = "demo/test/api-key"
  description = "Demo API credentials for Test environment"
}

resource "aws_secretsmanager_secret_version" "test_api_key" {
  secret_id = aws_secretsmanager_secret.test_api_key.id
  secret_string = jsonencode({
    api_key     = "test123456"
    service_url = "https://test-api.example.com"
  })
}

resource "aws_secretsmanager_secret" "prod_api_key" {
  name        = "demo/prod/api-key"
  description = "Demo API credentials for Prod environment"
}

resource "aws_secretsmanager_secret_version" "prod_api_key" {
  secret_id = aws_secretsmanager_secret.prod_api_key.id
  secret_string = jsonencode({
    api_key     = "prod789xyz"
    service_url = "https://api.example.com"
  })
}