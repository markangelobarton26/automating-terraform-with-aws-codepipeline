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

## 🎬 Consolidated Deployment Commands

### Stage 1: Basic EC2 (Hardcoded Values)
```bash
echo -e "stage1-basic-ec2\napply" > demo-config.txt
git add . && git commit -m "Deploy Stage 1: Basic EC2" && git push
```

### Stage 2: Parameter Store Integration
```bash
echo -e "stage2-parameter-store\napply" > demo-config.txt
git add . && git commit -m "Deploy Stage 2: Parameter Store" && git push
```

### Stage 3: Secrets Manager Integration
```bash
echo -e "stage3-secrets-manager\napply" > demo-config.txt
git add . && git commit -m "Deploy Stage 3: Secrets Manager" && git push
```

### Stage 4: Manual Approval Workflow
```bash
echo -e "stage4-manual-approval\napply" > demo-config.txt
git add . && git commit -m "Deploy Stage 4: Manual Approval" && git push
```

### Destroy Individual Stages
```bash
# Destroy Stage 1
echo -e "stage1-basic-ec2\ndestroy" > demo-config.txt
git add . && git commit -m "Destroy Stage 1" && git push

# Destroy Stage 2
echo -e "stage2-parameter-store\ndestroy" > demo-config.txt
git add . && git commit -m "Destroy Stage 2" && git push

# Destroy Stage 3
echo -e "stage3-secrets-manager\ndestroy" > demo-config.txt
git add . && git commit -m "Destroy Stage 3" && git push

# Destroy Stage 4
echo -e "stage4-manual-approval\ndestroy" > demo-config.txt
git add . && git commit -m "Destroy Stage 4" && git push
```

### Complete Cleanup (Destroy All Resources)
```bash
echo -e "stage4-manual-approval\ndestroy" > demo-config.txt
git add . && git commit -m "Cleanup: Destroy all resources" && git push
```

### Quick Stage Switching (One-liners)
```bash
# Stage 1
echo -e "stage1-basic-ec2\napply" > demo-config.txt && git add . && git commit -m "Stage 1" && git push

# Stage 2
echo -e "stage2-parameter-store\napply" > demo-config.txt && git add . && git commit -m "Stage 2" && git push

# Stage 3
echo -e "stage3-secrets-manager\napply" > demo-config.txt && git add . && git commit -m "Stage 3" && git push

# Stage 4
echo -e "stage4-manual-approval\napply" > demo-config.txt && git add . && git commit -m "Stage 4" && git push

# Destroy any stage
echo -e "stage1-basic-ec2\ndestroy" > demo-config.txt && git add . && git commit -m "Destroy Stage 1" && git push
echo -e "stage2-parameter-store\ndestroy" > demo-config.txt && git add . && git commit -m "Destroy Stage 2" && git push
echo -e "stage3-secrets-manager\ndestroy" > demo-config.txt && git add . && git commit -m "Destroy Stage 3" && git push
echo -e "stage4-manual-approval\ndestroy" > demo-config.txt && git add . && git commit -m "Destroy Stage 4" && git push
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
- [Manual Demo Guide](docs/MANUAL-DEMO.md) - Step-by-step instructions

## 🔐 Security Evolution Summary

| Stage | Security Level | Features | Use Case |
|-------|---------------|----------|----------|
| **Stage 1** | ❌ Basic | Hardcoded values, open security groups | Learning/Demo only |
| **Stage 2** | ⚙️ Good | Parameter Store, dynamic configuration | Development environments |
| **Stage 3** | 🔐 Enterprise | Secrets Manager, encrypted secrets | Production-ready |
| **Stage 4** | 🏆 Production | Manual approval, environment separation | Enterprise deployment |
