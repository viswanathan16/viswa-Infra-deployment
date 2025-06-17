module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  subnet_az =  "${var.aws_region}a"  # Assuming the region is ap-southeast-1, this will be ap-southeast-1a
  env = "dev"
}

module "ec2" {
   source = "../../modules/ec2"
   ami_id = "ami-0a7d80731ae1b2435"
   instance_type = "t2.micro"
   subnet_id = module.vpc.subnet_id
   ec2_count = 2
   env = "dev"

}

module "s3" {
  source = "../../modules/s3"
  bucket_name = "viswa-infrabucket"
  env    = "dev"
}
