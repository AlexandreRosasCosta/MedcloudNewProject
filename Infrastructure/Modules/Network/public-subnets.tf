resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet("${var.cidr_block}", 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    "${var.tags}",
    {
      Name    = "public-subnet-1a"
      Service = "Subnet"
  })
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet("${var.cidr_block}", 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    "${var.tags}",
    {
      Name    = "public-subnet-1b"
      Service = "Subnet"
  })
}