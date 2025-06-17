variable "env" {
    type = string
    description = "The environment for the S3 bucket (e.g., dev, staging, prod)"
}

variable "bucket_name" {
    type = string
    description = "The name of the S3 bucket"
    
}