# Stage 1: Basic EC2 Instance

## 🎯 Learning Goal
Deploy a simple EC2 instance to understand basic Terraform deployment in CI/CD.

## ⚠️ Security Issues Demonstrated
- **Hardcoded AMI ID**: Won't work across regions
- **Open Security Groups**: Accessible from anywhere on the internet
- **No Configuration Management**: All values embedded in code
- **No Secrets Management**: No sensitive data handling

## 🚀 What Gets Deployed
- Single EC2 instance (t2.micro)
- Basic security group (ports 80, 22 open)
- Simple web server with demo page

## 🎤 Speaker Talking Points

### Before Deployment
*"Let's start with the simplest possible deployment. This is how many teams begin - and it works, but has serious security issues we'll address in later stages."*

### During Deployment
*"Notice how we're using hardcoded values everywhere. The AMI ID 'ami-0c02fb55956c7d316' only works in us-east-1. What happens if we deploy to eu-west-1?"*

### After Deployment
*"Great! Our instance is running. But look at these security issues..."*
- Show security group rules in AWS Console
- Demonstrate the hardcoded AMI problem
- Visit the web page to show it works

### Key Teaching Moments
1. **Hardcoded Values**: *"This AMI ID is region-specific. In production, this breaks."*
2. **Security Groups**: *"Port 22 open to the world? That's a security audit failure."*
3. **No Flexibility**: *"Want to change instance type? You need to modify code."*

## 🔄 Pipeline Behavior
- ✅ Deploys successfully in us-east-1
- ❌ Would fail in other regions
- ⚠️ Creates security vulnerabilities

## 🎯 Next Stage Preview
*"In Stage 2, we'll fix the hardcoded values using AWS Parameter Store for better configuration management."*