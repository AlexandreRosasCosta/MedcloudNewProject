terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.9.0"
    }
  }
  backend "s3" {
    bucket = "project-bucket-tfstate"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "docker" {
  registry_auth {
    address  = local.ecr_address
    password = data.aws_ecr_authorization_token.current.password
    username = data.aws_ecr_authorization_token.current.user_name
  }
}