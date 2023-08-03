module "network" {
  source     = "./Modules/Network"
  cidr_block = var.cidr_block
}

module "container_service" {
  source                    = "./Modules/Services/ECS"
  ecr_image                 = module.repository.output_repository_arn
  ecs_security_group        = module.network.output_ecs_security_group
  vpc_id                    = module.network.output_vpc
  public_subnets            = ["${module.network.output_public_subnet_1a}", "${module.network.output_public_subnet_1b}"]
  alb_target_group          = module.load-balancer.output_alb_target_group_arn
  container_port            = var.container_port
  cloudwatch_log_group_name = module.cloudwatch.output_cloudwatch_log_group_name
}

module "load-balancer" {
  source            = "./Modules/Services/ALB"
  lb_security_group = module.network.output_application_lb_security_group
  public_subnets    = ["${module.network.output_public_subnet_1a}", "${module.network.output_public_subnet_1b}"]
  vpc_id            = module.network.output_vpc
  container_port    = var.container_port
}

module "cloudwatch" {
  source = "./Modules/Services/CloudWatch"
}

module "repository" {
  source = "./Modules/Services/ECR"
}