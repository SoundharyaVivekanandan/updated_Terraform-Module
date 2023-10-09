resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  # Other VPC configuration...
}
resource "aws_subnet" "private_subnet1" {
  #count             = 1
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.availability_zone_private_subnet1
  vpc_id            = aws_vpc.main.id
}

resource "aws_subnet" "private_subnet2" {
  #count             = 1
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.availability_zone_private_subnet2
  vpc_id            = aws_vpc.main.id
}


