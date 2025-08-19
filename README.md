# Progressive Terraform Security with AWS CodePipeline

## 🎯 Demo Overview
This repository demonstrates how to progressively secure Terraform deployments in a CI/CD pipeline, teaching cloud engineers the evolution from basic to enterprise-grade security practices.

## 🏗️ Architecture
```
GitHub Repository → CodePipeline → CodeBuild → Terraform Apply → AWS Resources
```

## 📚 Learning Journey

**Stage 1:** Basic EC2 (Hardcoded values - security issues)  
**Stage 2:** Parameter Store (Configuration management)  
**Stage 3:** Secrets Manager (Enterprise security)  
**Stage 4:** Manual Approval (Environment-specific deployments)

## 🚀 Quick Start

### 1. Setup Pipeline
```bash
cd pipeline-infrastructure
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your GitHub connection ARN and repo URL
terraform init && terraform apply
```

### 2. Setup Prerequisites
```bash
# Parameter Store
aws ssm put-parameter --name "/demo/ec2/instance-type" --value "t2.micro" --type "String"
aws ssm put-parameter --name "/demo/security/allowed-cidr" --value "YOUR_IP/32" --type "String"

# Secrets Manager
aws secretsmanager create-secret --name "demo/app/api-key" --secret-string '{"api_key":"test123","service_url":"https://api.example.com"}'
```

### 3. Deploy Stages
```bash
# Push to GitHub (deploys Stage 1)
git push origin main

# Switch to Stage 2
echo "stage2-parameter-store" > demo-config.txt
git add . && git commit -m "Deploy Stage 2" && git push

# Switch to Stage 3
echo "stage3-secrets-manager" > demo-config.txt
git add . && git commit -m "Deploy Stage 3" && git push

# Switch to Stage 4
echo "stage4-manual-approval" > demo-config.txt
git add . && git commit -m "Deploy Stage 4" && git push
```

## 📁 Repository Structure
```
├── demo-project/           # 4 progressive demo stages
├── pipeline-infrastructure/ # CodePipeline Terraform code
├── docs/                   # Documentation and diagrams
├── demo-config.txt         # Controls which stage to deploy
└── buildspec.yml           # CodeBuild configuration
```

## 📚 Documentation
- [Visual Diagrams](docs/diagrams.md) - Architecture and security evolution
- [Docker Setup](docs/DOCKER-SETUP.md) - Container-based demo
- [Manual Demo Guide](docs/MANUAL-DEMO.md) - Step-by-step instructions# automating-terraform-with-aws-codepipeline
