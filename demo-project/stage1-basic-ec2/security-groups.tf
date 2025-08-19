# Basic security group with hardcoded rules
resource "aws_security_group" "web" {
  name_prefix = "demo-web-"
  description = "Security group for web server"

  # HTTP access (hardcoded port)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to world (not secure!)
  }

  # SSH access (hardcoded port)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to world (not secure!)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "demo-web-sg-stage1"
    Stage = "1-basic"
  }
}