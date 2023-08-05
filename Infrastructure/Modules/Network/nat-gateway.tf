resource "aws_nat_gateway" "nat_gateway_1a" {
  allocation_id = aws_eip.elastic_ip_1a.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = merge(
    "${var.tags}",
    {
      Name    = "nat-gateway-public-subnet-1a"
      Service = "Nat-Gateway"
  })
}

resource "aws_nat_gateway" "nat_gateway_1b" {
  allocation_id = aws_eip.elastic_ip_1b.id
  subnet_id     = aws_subnet.public_subnet_1b.id

  tags = merge(
    "${var.tags}",
    {
      Name    = "nat-gateway-public-subnet-1b"
      Service = "Nat-Gateway"
  })
}