module "network" {
  source = "./Modules/Network"
  cidr_block = var.cidr_block
}

module "repository" {
  source = "./Modules/Services/ECR"
}