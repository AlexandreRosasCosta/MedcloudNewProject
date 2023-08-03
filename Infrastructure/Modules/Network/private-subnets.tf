resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet("${var.cidr_block}", 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = {
    Name = "private-subnet-1a"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet("${var.cidr_block}", 8, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = {
    Name = "private-subnet-1b"
  }
}