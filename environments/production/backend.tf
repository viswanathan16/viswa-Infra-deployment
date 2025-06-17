terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }

backend "s3" {
  bucket         = "viswa-terraform-bucket"
  key            = "environments/production/terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "viswa-infra"
 }
}
provider "aws" {
    region = var.aws_region
    }

