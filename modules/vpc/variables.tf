 variable "env" {
    description = "The environment for the EC2 instance (e.g., dev, staging, prod)."
    type        = string
  }

  variable "vpc_cidr" {
    description = "The CIDR block for the VPC."
    type        = string
  }

   variable "subnet_cidr" {
    description = "The CIDR block for the VPC."
    type        = string
  }

  variable "subnet_az" {
  
    description = "The availability zone for the subnet."
    type        = string
  }