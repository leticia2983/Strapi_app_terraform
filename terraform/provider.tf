terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}



provider "aws" {
  region = var.aws_region
  access_key = 'secrets.AWS_ACCESS_KEY_ID'
  secret_key = 'secrets.AWS_SECRET_ACCESS_KEY'
}
