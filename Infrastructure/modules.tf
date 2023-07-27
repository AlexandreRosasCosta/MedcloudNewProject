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
  vpc_id             = module.network.output_vpc
  subnets            = ["${module.network.output_public_subnet_1a}", "${module.network.output_public_subnet_1b}"]
}

module "load-balancer" {
  source = "./Modules/Services/ALB"
  lb_security_group  = module.network.output_application_lb_security_group
  vpc_id             = module.network.output_vpc
  subnets            = ["${module.network.output_public_subnet_1a}", "${module.network.output_public_subnet_1b}"]
}