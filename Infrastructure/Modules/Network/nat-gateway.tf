resource "aws_eip" "elastic_ip_1a" {
  domain = "vpc"
}

resource "aws_eip" "elastic_ip_1b" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway_1a" {
  allocation_id = aws_eip.elastic_ip_1a.id
  subnet_id     = aws_subnet.pub-subnet-1a.id

  tags = {
    Name = "nat-gateway-public-subnet-1a"
  }
}

resource "aws_nat_gateway" "nat_gateway_1b" {
  allocation_id = aws_eip.elastic_ip_1b.id
  subnet_id     = aws_subnet.pub-subnet-1b.id

  tags = {
    Name = "nat-gateway-public-subnet-1b"
  }
}

resource "aws_route_table" "private_route_table_1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_1a.id
  }

  tags = {
    Name = "priv-route-table-1a"
  }
}

resource "aws_route_table" "private_route_table_1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_1b.id
  }

  tags = {
    Name = "priv-route-table-1b"
  }
}