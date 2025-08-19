# EC2 instance using Parameter Store values
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
              echo "<h1>Stage 2: Parameter Store Integration</h1>" > /var/www/html/index.html
              echo "<p>AMI ID: ${data.aws_ssm_parameter.amazon_linux_ami.value} (from Parameter Store)</p>" >> /var/www/html/index.html
              echo "<p>Instance Type: ${data.aws_ssm_parameter.instance_type.value} (from Parameter Store)</p>" >> /var/www/html/index.html
              echo "<p>Region: ${var.aws_region}</p>" >> /var/www/html/index.html
              EOF

  tags = {
    Name        = "demo-web-server-stage2"
    Environment = "demo"
    Stage       = "2-parameter-store"
  }
}