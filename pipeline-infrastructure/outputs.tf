# Pipeline outputs
output "pipeline_name" {
  description = "Name of the CodePipeline"
  value       = aws_codepipeline.terraform_pipeline.name
}

output "codebuild_project_name" {
  description = "Name of the CodeBuild project"
  value       = aws_codebuild_project.demo_build.name
}

output "terraform_state_bucket" {
  description = "S3 bucket for Terraform state"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "pipeline_artifacts_bucket" {
  description = "S3 bucket for pipeline artifacts"
  value       = aws_s3_bucket.pipeline_artifacts.bucket
}

# Prerequisites outputs
output "parameter_store_parameters" {
  description = "Created Parameter Store parameters"
  value = {
    instance_type      = aws_ssm_parameter.instance_type.name
    allowed_cidr       = aws_ssm_parameter.allowed_cidr.name
    test_instance_type = aws_ssm_parameter.test_instance_type.name
    prod_instance_type = aws_ssm_parameter.prod_instance_type.name
  }
}

output "secrets_manager_secrets" {
  description = "Created Secrets Manager secrets"
  value = {
    api_key      = aws_secretsmanager_secret.api_key.name
    test_api_key = aws_secretsmanager_secret.test_api_key.name
    prod_api_key = aws_secretsmanager_secret.prod_api_key.name
  }
}