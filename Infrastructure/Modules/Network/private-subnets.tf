resource "aws_subnet" "priv-subnet-1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet("${var.cidr_block}", 8, 3)
  availability_zone = "us-east-1a"
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "priv-subnet-1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet("${var.cidr_block}", 8, 4)
  availability_zone = "us-east-1b"
  tags = {
    Name = "Main"
  }
}