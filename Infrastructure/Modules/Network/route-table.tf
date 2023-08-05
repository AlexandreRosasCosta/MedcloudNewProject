resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    "${var.tags}",
    {
      Name    = "public-route-table"
      Service = "Route-Table"
  })
}

resource "aws_route_table" "private_route_table_1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_1a.id
  }

  tags = merge(
    "${var.tags}",
    {
      Name    = "private-route-table-1a"
      Service = "Route-Table"
  })
}

resource "aws_route_table" "private_route_table_1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_1b.id
  }
  
  tags = merge(
    "${var.tags}",
    {
      Name    = "private-route-table-1b"
      Service = "Route-Table"
  })
}

resource "aws_route_table_association" "public_route_table_assoc_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_assoc_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_assoc_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_route_table_1a.id
}

resource "aws_route_table_association" "private_route_table_assoc_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private_route_table_1b.id
}