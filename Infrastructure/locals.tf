locals {
  container_name = "nodeapp-service"
  container_port = var.container_port
}

locals {
  ecr_address = format("%v.dkr.ecr.%v.amazonaws.com", data.aws_caller_identity.this.account_id, data.aws_region.this.name)
}

locals {
  account_id = data.aws_caller_identity.current.account_id
  aws_region = data.aws_region.current.name
}
