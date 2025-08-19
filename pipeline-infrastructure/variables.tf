variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "terraform-demo"
}

variable "github_connection_arn" {
  description = "GitHub connection ARN (created manually in AWS Console)"
  type        = string
}

variable "github_repo_url" {
  description = "Full GitHub repository URL (e.g., https://github.com/owner/repo)"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch"
  type        = string
  default     = "main"
}

