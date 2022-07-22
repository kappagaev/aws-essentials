
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    "Name" = "PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    "Name" = "PublicSubnet2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.1.3.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    "Name" = "PrivateSubnet1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.1.4.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    "Name" = "PrivateSubnet2"
  }
}

