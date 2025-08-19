output "pipeline_name" {
  description = "Name of the CodePipeline"
  value       = aws_codepipeline.terraform_pipeline.name
}

output "pipeline_url" {
  description = "URL to the CodePipeline console"
  value       = "https://${var.aws_region}.console.aws.amazon.com/codesuite/codepipeline/pipelines/${aws_codepipeline.terraform_pipeline.name}/view"
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

output "next_steps" {
  description = "Next steps for the demo"
  value = [
    "1. Push this repository to GitHub",
    "2. Pipeline will automatically trigger",
    "3. Check pipeline status: ${aws_codepipeline.terraform_pipeline.name}",
    "4. View deployed resources in AWS console"
  ]
}