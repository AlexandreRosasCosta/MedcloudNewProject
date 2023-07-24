resource "aws_subnet" "pub-subnet-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet("${var.cidr_block}", 8, 1)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1a"
  }
}

resource "aws_subnet" "pub-subnet-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet("${var.cidr_block}", 8, 2)
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1b"
  }
}

resource "aws_route_table_association" "public_route_table_assoc_1a" {
  subnet_id      = aws_subnet.pub-subnet-1a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_assoc_1b" {
  subnet_id      = aws_subnet.pub-subnet-1b.id
  route_table_id = aws_route_table.public_route_table.id
}