terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }

backend "s3" {
  bucket         = "viswa-terraform-bucket"
  key            = "environments/dev/terraform.tfstate"
  region         = "us-east-1"
  
 }
}
provider "aws" {
    region = var.aws_region
    }

