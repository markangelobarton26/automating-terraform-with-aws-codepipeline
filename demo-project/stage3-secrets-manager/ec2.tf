# EC2 instance with secrets integration
resource "aws_instance" "web_server" {
  ami           = data.aws_ssm_parameter.amazon_linux_ami.value
  instance_type = data.aws_ssm_parameter.instance_type.value
  
  vpc_security_group_ids = [aws_security_group.web.id]
  
  user_data = base64encode(templatefile("${path.module}/user-data.sh", {
    ami_id       = data.aws_ssm_parameter.amazon_linux_ami.value
    instance_type = data.aws_ssm_parameter.instance_type.value
    aws_region   = var.aws_region
    api_key      = local.api_credentials.api_key
    service_url  = local.api_credentials.service_url
  }))

  tags = {
    Name        = "demo-web-server-stage3"
    Environment = "demo"
    Stage       = "3-secrets-manager"
  }
}