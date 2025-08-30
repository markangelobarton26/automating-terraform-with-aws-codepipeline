terraform {
  backend "s3" {
    bucket = "bartz2-devops-terraform-tfstate"
    key    = "automating-terraform-with-aws-codepipeline/terraform.tfstate"
    region = "ap-southeast-1"
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = ""
  region = var.aws_region
}

# Random suffix for unique resource names
resource "random_id" "suffix" {
  byte_length = 4
}