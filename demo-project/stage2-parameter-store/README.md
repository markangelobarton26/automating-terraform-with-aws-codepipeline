# Stage 2: Parameter Store Integration

## 🎯 Learning Goal
Use AWS Systems Manager Parameter Store for centralized configuration management.

## 🔧 Setup Required
Run the setup script before deployment:
```bash
./setup-parameters.sh
```

## ✅ Security Improvements
- **Dynamic AMI Selection**: Uses AWS-managed parameter for latest AMI
- **Externalized Configuration**: Instance type and CIDR blocks in Parameter Store
- **Region Agnostic**: Works in any AWS region
- **Centralized Management**: Configuration changes without code changes

## 🚀 What Gets Deployed
- EC2 instance with dynamic AMI selection
- Security group with configurable CIDR blocks
- Web server showing Parameter Store values

## 🎤 Speaker Talking Points

### Before Deployment
*"Now we'll improve our security by externalizing configuration. No more hardcoded values!"*

### Setup Phase
*"First, let's create our parameters. Notice how we're restricting access to your current IP instead of the entire internet."*

```bash
# Show the setup script running
./setup-parameters.sh
```

### During Deployment
*"Watch how Terraform retrieves values from Parameter Store. The AMI ID is now region-specific and always the latest."*

### After Deployment
*"Great improvements! But we still have a problem - what about database passwords and API keys? That's where Secrets Manager comes in."*

## 🔍 Key Teaching Moments

### 1. Parameter Store Benefits
- **Cost**: Free for standard parameters
- **Integration**: Native AWS service integration
- **Versioning**: Track parameter changes
- **Access Control**: IAM-based permissions

### 2. Security Improvements
- **No Hardcoded Values**: Configuration externalized
- **IP Restriction**: Security group limited to your IP
- **Dynamic AMI**: Always uses latest, region-appropriate AMI

### 3. Operational Benefits
- **No Code Changes**: Update parameters without redeployment
- **Environment Consistency**: Same code, different parameters
- **Audit Trail**: Parameter change history

## 🔄 Pipeline Behavior
- ✅ Works in any AWS region
- ✅ Retrieves latest AMI automatically
- ✅ Uses restricted CIDR blocks
- ⚠️ Still no secrets management

## 🎯 Next Stage Preview
*"Parameter Store is great for configuration, but what about sensitive data like database passwords? Stage 3 introduces AWS Secrets Manager for true secrets management."*