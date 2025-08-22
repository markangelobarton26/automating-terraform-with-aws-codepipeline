#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

cat > /var/www/html/index.html << 'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>Stage 3: Secrets Manager Integration</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f0fff4; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        h1 { color: #2d5016; border-bottom: 3px solid #38a169; padding-bottom: 10px; }
        h2 { color: #38a169; }
        .info { background: #e6fffa; padding: 15px; border-radius: 5px; margin: 10px 0; border-left: 4px solid #38a169; }
        .security { background: #f0fff4; padding: 15px; border-radius: 5px; margin: 10px 0; }
        ul { list-style-type: none; padding: 0; }
        li { padding: 5px 0; }
        .checkmark { color: #38a169; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔐 Stage 3: Secrets Manager Integration</h1>
        
        <div class="info">
            <p><strong>AMI ID:</strong> ${ami_id} (from Parameter Store)</p>
            <p><strong>Instance Type:</strong> ${instance_type} (from Parameter Store)</p>
            <p><strong>Region:</strong> ${aws_region}</p>
            <p><strong>API Key:</strong> ${api_key} (from Secrets Manager)</p>
            <p><strong>Service URL:</strong> ${service_url} (from Secrets Manager)</p>
        </div>
        
        <div class="security">
            <h2>🏆 Enterprise Security Features:</h2>
            <ul>
                <li><span class="checkmark">✅</span> API credentials stored in AWS Secrets Manager</li>
                <li><span class="checkmark">✅</span> Automatic password rotation capability</li>
                <li><span class="checkmark">✅</span> AES-256 encryption at rest and in transit</li>
                <li><span class="checkmark">✅</span> CloudTrail audit trail for secret access</li>
                <li><span class="checkmark">✅</span> Fine-grained IAM permissions</li>
                <li><span class="checkmark">✅</span> No secrets exposed in Terraform state</li>
                <li><span class="checkmark">✅</span> Restricted security group (Parameter Store CIDR)</li>
            </ul>
        </div>
        
        <div class="info">
            <h3>🔒 Security Evolution:</h3>
            <p><strong>Stage 1:</strong> ❌ Hardcoded values, open security groups</p>
            <p><strong>Stage 2:</strong> ⚙️ Parameter Store configuration</p>
            <p><strong>Stage 3:</strong> 🔐 Enterprise-grade Secrets Manager</p>
        </div>
        
        <p><em>Deployed via AWS CodePipeline → CodeBuild → Terraform</em></p>
    </div>
</body>
</html>
HTML

# Set proper permissions
chown apache:apache /var/www/html/index.html
chmod 644 /var/www/html/index.html