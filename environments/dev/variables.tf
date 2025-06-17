variable "aws_region" {
    type = string
    default = "us-east-1"
    description = "value of the region in which the resources will be created"

}
variable "env" {
    type = string
    default = "dev"
    description = "The environment for the infrastructure (e.g., dev, staging, prod)"
}