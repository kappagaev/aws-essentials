resource "aws_vpc" "main" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "AWS ESSENTIALS VPC"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "Main Internet Gateway"
  }
}
