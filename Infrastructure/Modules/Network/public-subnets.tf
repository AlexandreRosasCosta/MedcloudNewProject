resource "aws_subnet" "pub-subnet-1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet("${var.cidr_block}", 8, 1)
  availability_zone = "us-east-1a"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "pub-subnet-1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet("${var.cidr_block}", 8, 2)
  availability_zone = "us-east-1b"

  tags = {
    Name = "Main"
  }
}
