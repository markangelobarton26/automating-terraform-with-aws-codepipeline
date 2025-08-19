# Get AMI ID from Parameter Store
data "aws_ssm_parameter" "amazon_linux_ami" {
  name = "/demo/ec2/ami-id"
}

# Get instance type from Parameter Store
data "aws_ssm_parameter" "instance_type" {
  name = "/demo/ec2/instance-type"
}

# Get allowed CIDR from Parameter Store
data "aws_ssm_parameter" "allowed_cidr" {
  name = "/demo/security/allowed-cidr"
}