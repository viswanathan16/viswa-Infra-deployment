variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the instance."
  type        = string
}

variable "ec2_count" {
  description = "The number of EC2 instances to create."
  type        = number
  }
  variable "env" {
    description = "The environment for the EC2 instance (e.g., dev, staging, prod)."
    type        = string
  }
