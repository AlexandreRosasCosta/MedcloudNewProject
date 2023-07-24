resource "aws_subnet" "priv_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet("${var.cidr_block}", 8, 3)
  availability_zone = "${var.region}a"

  tags = {
    Name = "private-subnet-1a"
  }
}

resource "aws_subnet" "priv_subnet_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet("${var.cidr_block}", 8, 4)
  availability_zone = "${var.region}b"

  tags = {
    Name = "private-subnet-1b"
  }
}

resource "aws_route_table_association" "private_route_table_assoc_1a" {
  subnet_id      = aws_subnet.priv_subnet_1a.id
  route_table_id = aws_route_table.private_route_table_1a.id
}

resource "aws_route_table_association" "private_route_table_assoc_1b" {
  subnet_id      = aws_subnet.priv_subnet_1b.id
  route_table_id = aws_route_table.private_route_table_1b.id
}