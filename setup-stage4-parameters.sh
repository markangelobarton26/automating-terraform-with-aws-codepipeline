#!/bin/bash

# Setup Stage 4 Parameters for Environment Separation
echo "Setting up Stage 4 parameters for environment separation..."

# Test Environment Parameters
echo "Creating test environment parameters..."
aws ssm put-parameter --name "/demo/test/ec2/instance-type" --value "t2.micro" --type "String" --overwrite
aws secretsmanager create-secret --name "demo/test/app/api-key" --secret-string '{"api_key":"test-api-key-123","service_url":"https://test-api.example.com"}' --region ap-southeast-1 2>/dev/null || \
aws secretsmanager update-secret --secret-id "demo/test/app/api-key" --secret-string '{"api_key":"test-api-key-123","service_url":"https://test-api.example.com"}'

# Production Environment Parameters  
echo "Creating production environment parameters..."
aws ssm put-parameter --name "/demo/prod/ec2/instance-type" --value "t2.small" --type "String" --overwrite
aws secretsmanager create-secret --name "demo/prod/app/api-key" --secret-string '{"api_key":"prod-api-key-456","service_url":"https://prod-api.example.com"}' --region ap-southeast-1 2>/dev/null || \
aws secretsmanager update-secret --secret-id "demo/prod/app/api-key" --secret-string '{"api_key":"prod-api-key-456","service_url":"https://prod-api.example.com"}'

echo "✅ Stage 4 parameters created successfully!"
echo ""
echo "Test Environment:"
echo "  - Instance Type: t2.micro"
echo "  - API Key: test-api-key-123"
echo ""
echo "Production Environment:"
echo "  - Instance Type: t2.small" 
echo "  - API Key: prod-api-key-456"