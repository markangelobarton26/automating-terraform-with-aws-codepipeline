# Basic EC2 instance with hardcoded values
resource "aws_instance" "web_server" {
  ami           = "ami-0779c82fbb81e731c" # Amazon Linux 2 (hardcoded - not secure!)
  instance_type = "t2.micro"
  
  vpc_security_group_ids = [aws_security_group.web.id]
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Stage 1: Basic EC2 - Hardcoded Values</h1>" > /var/www/html/index.html
              echo "<p>AMI ID: ami-0779c82fbb81e731c (hardcoded)</p>" >> /var/www/html/index.html
              EOF

  tags = {
    Name        = "demo-web-server-stage1"
    Environment = "demo"
    Stage       = "1-basic"
  }
}