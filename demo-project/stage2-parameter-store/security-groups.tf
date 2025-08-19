# Security group using Parameter Store for CIDR
resource "aws_security_group" "web" {
  name_prefix = "demo-web-stage2-"
  description = "Security group for web server - Stage 2"

  # HTTP access with restricted CIDR from Parameter Store
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [data.aws_ssm_parameter.allowed_cidr.value]
  }

  # SSH access with restricted CIDR from Parameter Store
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_ssm_parameter.allowed_cidr.value]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "demo-web-sg-stage2"
    Stage = "2-parameter-store"
  }
}