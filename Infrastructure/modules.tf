module "network" {
  source     = "./Modules/Network"
  cidr_block = var.cidr_block
  region     = data.aws_region.current.name
}

module "repository" {
  source = "./Modules/Services/ECR"
}

module "container_service" {
  source             = "./Modules/Services/ECS"
  ecr_repository     = module.repository.output_repository
  ecs_security_group = module.network.output_ecs_security_group
}