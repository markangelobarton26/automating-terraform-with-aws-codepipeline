# Docker Setup Guide

## 🐳 Prerequisites

### 1. Install Docker Desktop
- **Mac**: Download from https://docker.com/products/docker-desktop
- **Windows**: Download from https://docker.com/products/docker-desktop  
- **Linux**: Install docker and docker-compose via package manager

### 2. Configure AWS Credentials
```bash
aws configure
# Enter your AWS Access Key ID, Secret, Region (us-east-1), and output format (json)
```

## 🚀 Quick Start

### Option 1: One-Command Demo (Recommended)
```bash
./run-docker-demo.sh
```

### Option 2: Manual Docker Commands
```bash
# Build the image
docker-compose build

# Run interactive container
docker-compose run --rm terraform-demo

# Inside container, run the demo
cd demo-project && ./run-demo.sh
```

## 🎯 What's Included in the Container

### Tools:
- ✅ Terraform 1.5.0
- ✅ AWS CLI v2
- ✅ Bash shell
- ✅ OpenSSL (for secret generation)
- ✅ All demo scripts

### Mounted Volumes:
- `~/.aws` → AWS credentials (read-only)
- Current directory → Live editing capability

## 🔧 Troubleshooting

### Docker Not Running
```bash
# Start Docker Desktop and wait for it to fully load
docker info  # Should show Docker system info
```

### AWS Credentials Issues
```bash
# Check if credentials exist
ls ~/.aws/

# Test AWS access
aws sts get-caller-identity
```

### Permission Issues (Linux)
```bash
# Add user to docker group
sudo usermod -aG docker $USER
# Log out and back in
```

## 🎤 For Workshop Leaders

### Pre-Workshop Setup:
1. Test the Docker setup on your machine
2. Share this repository with participants
3. Have participants run `./run-docker-demo.sh` before the session
4. Verify everyone can access AWS from the container

### During Workshop:
```bash
# Everyone runs the same command
./run-docker-demo.sh

# Inside container, follow along
cd demo-project && ./run-demo.sh
```

### Benefits:
- ✅ Consistent environment across all machines
- ✅ No local tool installation required
- ✅ Works on Mac, Windows, Linux
- ✅ Easy cleanup (just remove container)

## 🧹 Cleanup

### Remove Container and Images:
```bash
docker-compose down
docker rmi $(docker images -q terraform-security-demo)
```

### Keep Images for Future Use:
```bash
# Just stop the container (keeps image for faster restart)
docker-compose down
```