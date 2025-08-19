terraform {
  backend "s3" {
    bucket = "anthony-terraform-tfstate"
    key    = "automating-terraform-with-aws-codepipeline/stage1/terraform.tfstate"
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
  region = "ap-southeast-1"
}