# Manual Demo Guide

## Prerequisites
- AWS CLI configured (`aws configure`)
- Terraform installed
- Appropriate AWS permissions

## Quick Manual Run

### Option 1: Use Demo Runner Script
```bash
cd demo-project
./run-demo.sh
```

### Option 2: Run Each Stage Manually

#### Stage 1: Basic EC2
```bash
cd demo-project/stage1-basic-ec2
terraform init
terraform plan
terraform apply
# Visit the output URL to see the web page
terraform destroy  # When done
```

#### Stage 2: Parameter Store
```bash
cd ../stage2-parameter-store
./setup-parameters.sh  # Creates Parameter Store values
terraform init
terraform plan
terraform apply
# Visit the output URL
terraform destroy  # When done
```

#### Stage 3: Secrets Manager
```bash
cd ../stage3-secrets-manager
./setup-secrets.sh  # Creates Secrets Manager secret
terraform init
terraform plan
terraform apply
# Visit the output URL
terraform destroy  # When done
```

## Manual Cleanup
```bash
# Clean up Parameter Store
aws ssm delete-parameter --name "/demo/ec2/instance-type"
aws ssm delete-parameter --name "/demo/security/allowed-cidr"

# Clean up Secrets Manager
aws secretsmanager delete-secret --secret-id "demo/app/api-key" --force-delete-without-recovery
```

## What You'll See
- **Stage 1**: Basic web page showing hardcoded values
- **Stage 2**: Web page showing Parameter Store values
- **Stage 3**: Web page showing both Parameter Store and Secrets Manager values

Each stage demonstrates the security progression!