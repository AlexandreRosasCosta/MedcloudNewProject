data "aws_region" "current" {}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [module.network.output_vpc]
  }
}