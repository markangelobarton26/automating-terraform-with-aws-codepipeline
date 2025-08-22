# Simple Demo Pipeline
resource "aws_codepipeline" "terraform_pipeline" {
  name     = "${var.project_name}-demo-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.pipeline_artifacts.bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.github_connection_arn
        FullRepositoryId = replace(var.github_repo_url, "https://github.com/", "")
        BranchName       = var.github_branch
      }
    }
  }

  stage {
    name = "Approval"
    action {
      name     = "Manual-Approval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"

      configuration = {
        CustomData = "Please review the deployment and approve to proceed with Terraform apply."
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name            = "Deploy-Demo-Stage"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output"]
      version         = "1"

      configuration = {
        ProjectName = aws_codebuild_project.demo_build.name
      }
    }
  }

  tags = {
    Name = "${var.project_name}-demo-pipeline"
  }
}