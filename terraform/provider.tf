terraform {
  backend "s3" {
    bucket = "your-terraform-bucket"
    key    = "amplifytest_environment"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
