# Get AMI ID from Parameter Store
data "aws_ssm_parameter" "amazon_linux_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# Get instance type from Parameter Store
data "aws_ssm_parameter" "instance_type" {
  name = "/demo/ec2/instance-type"
}

# Get allowed CIDR from Parameter Store
data "aws_ssm_parameter" "allowed_cidr" {
  name = "/demo/security/allowed-cidr"
}