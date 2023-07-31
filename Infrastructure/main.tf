terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.9.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    bucket = "project-bucket-tfstate"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}