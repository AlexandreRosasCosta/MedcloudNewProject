module "network" {
  source     = "./Modules/Network"
  cidr_block = var.cidr_block
  region     = data.aws_region.current.name
}

module "repository" {
  source     = "./Modules/Services/ECR"
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
}

module "cloudwatch" {
  source = "./Modules/Services/CloudWatch"
}

module "container_service" {
  source               = "./Modules/Services/ECS"
  image                = docker_image.this.name
  ecs_security_group   = module.network.output_ecs_security_group
  vpc_id               = module.network.output_vpc
  subnets              = ["${module.network.output_public_subnet_1a}", "${module.network.output_public_subnet_1b}"]
  alb_target_group     = module.load-balancer.output_alb_target_group_arn
  container_port       = local.container_port
  region               = data.aws_region.current.name
  cloudwatch-log-group = module.cloudwatch.output_cloudwatch_log_group_name
}

module "load-balancer" {
  source            = "./Modules/Services/ALB"
  lb_security_group = module.network.output_application_lb_security_group
  vpc_id            = module.network.output_vpc
  subnets           = ["${module.network.output_public_subnet_1a}", "${module.network.output_public_subnet_1b}"]
  container_port    = local.container_port
}
