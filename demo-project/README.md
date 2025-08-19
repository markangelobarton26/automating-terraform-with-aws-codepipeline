# Progressive Terraform Security Demo

## Learning Journey: From Basic to Secure Infrastructure

This demo teaches you how to progressively secure your Terraform deployments in a CI/CD pipeline.

### 🎯 Learning Objectives
- Deploy basic infrastructure with Terraform
- Understand security risks of hardcoded values
- Learn AWS Parameter Store for configuration
- Implement AWS Secrets Manager for sensitive data
- Apply security best practices in CI/CD

### 📚 Demo Stages

#### Stage 1: Basic EC2 Instance
**What you'll learn:** Basic Terraform deployment
**Security level:** ⚠️ Basic (hardcoded values)
```
Hardcoded AMI ID → EC2 Instance
```

#### Stage 2: Parameter Store Integration  
**What you'll learn:** Centralized configuration management
**Security level:** 🔒 Better (externalized config)
```
Parameter Store → Dynamic AMI Selection → EC2 Instance
```

#### Stage 3: Secrets Manager Integration
**What you'll learn:** Secure secrets management
**Security level:** 🔐 Best (encrypted secrets)
```
Secrets Manager → Secure DB Password → RDS + EC2
```

### 🚀 How to Use This Demo

1. **Start with Stage 1** - Deploy basic infrastructure
2. **Progress to Stage 2** - Add Parameter Store
3. **Complete with Stage 3** - Implement Secrets Manager

Each stage builds upon the previous one, showing the evolution from basic to secure infrastructure deployment.

### 🎤 Speaker Notes
- Emphasize security progression at each stage
- Show real AWS console during deployment
- Highlight cost implications of each approach
- Demonstrate pipeline failures and recovery