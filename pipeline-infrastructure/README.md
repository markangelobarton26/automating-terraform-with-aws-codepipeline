# Pipeline Infrastructure

## 🎯 Purpose
This Terraform code provisions the AWS CodePipeline infrastructure needed for the progressive security demo.

## 🏗️ What Gets Created
- **S3 Buckets**: Terraform state storage and pipeline artifacts
- **IAM Roles**: CodeBuild and CodePipeline service roles with appropriate permissions
- **CodeBuild Project**: Builds and deploys Terraform configurations
- **CodePipeline**: Automated pipeline triggered by GitHub commits

## 🚀 Quick Setup

### Prerequisites
- AWS CLI configured
- Terraform installed
- GitHub repository with this code
- GitHub connection created in AWS Console

### Setup GitHub Connection (One-time)
1. Go to AWS Console → Developer Tools → Settings → Connections
2. Create connection → GitHub → Follow OAuth flow
3. Copy the connection ARN

### Deploy Pipeline
```bash
# 1. Copy and edit tfvars file
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars:
# - Add your GitHub connection ARN
# - Add your repository URL

# 2. Deploy infrastructure
terraform init
terraform apply
```

## 🎤 For Presentation Flow

### 1. Introduction & Architecture
- Explain Terraform and CI/CD concepts
- Show architecture diagrams

### 2. ClickOps Demo (Optional)
- Manually create pipeline in AWS Console
- Show the complexity and manual steps

### 3. Infrastructure as Code
```bash
cd pipeline-infrastructure
./setup-pipeline.sh
```

### 4. Deploy Pipeline
- Show Terraform plan/apply output
- Visit AWS Console to see created resources

### 5. Progressive Demo Stages
- Push code to trigger pipeline
- Show each stage deployment
- Demonstrate security improvements

## 🔧 Pipeline Configuration

### Environment Variables
- `DEMO_STAGE`: Which demo stage to deploy
- `TF_STATE_BUCKET`: S3 bucket for Terraform state

### Supported Demo Stages
- `stage1-basic-ec2`
- `stage2-parameter-store`
- `stage3-secrets-manager`
- `stage4-manual-approval`

### Change Demo Stage
```bash
# Update the pipeline to deploy different stage
terraform apply -var="demo_stage=stage2-parameter-store"
```

## 🔄 Pipeline Flow
1. **Source**: GitHub repository change triggers pipeline
2. **Build**: CodeBuild runs buildspec.yml
3. **Deploy**: Terraform applies the specified demo stage

## 🧹 Cleanup
```bash
terraform destroy
```

## 🎯 Teaching Points
- **Infrastructure as Code**: Pipeline itself is defined in code
- **Automation**: No manual steps after initial setup
- **Security**: IAM roles with least privilege
- **State Management**: Centralized Terraform state in S3