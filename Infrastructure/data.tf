data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_ecr_authorization_token" "current" {}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [module.network.output_vpc]
  }
}
