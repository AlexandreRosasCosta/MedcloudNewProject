resource "aws_eip" "elastic_ip_1a" {
  domain = "vpc"

  tags = merge(
    "${var.tags}",
    {
      Name    = "elastic-ip-1a"
      Service = "Elastic-IP"
  })
}

resource "aws_eip" "elastic_ip_1b" {
  domain = "vpc"
  
  tags = merge(
    "${var.tags}",
    {
      Name    = "elastic-ip-1b"
      Service = "Elastic-IP"
  })
}