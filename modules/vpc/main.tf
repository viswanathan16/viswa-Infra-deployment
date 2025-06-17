resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_az

  tags = {
    Name =  "${var.env}-subnet"
  }
}

output "subnet_id" {
  value = aws_subnet.main.id
  description = "value of subnet id in which the ec2 instance will be created"
   
}