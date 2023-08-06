# Module for Network
module "network" {
  source     = "./Modules/Network"
  cidr_block = var.cidr_block
  tags       = local.tags
}

# Module for ECS
module "container_service" {  
  source                             = "./Modules/Services/ECS"
  alb_name                           = module.load_balancer.output_alb_name
  alb_target_group                   = module.load_balancer.output_alb_target_group_arn
  aws_cloudwatch_metric_alarm_cpu    = module.cloudwatch.output_aws_cloudwatch_metric_alarm_cpu
  aws_cloudwatch_metric_alarm_memory = module.cloudwatch.output_aws_cloudwatch_metric_alarm_memory
  container_port                     = var.container_port
  cloudwatch_log_group_name          = module.cloudwatch.output_cloudwatch_log_group_name
  ecr_image                          = module.repository.output_repository_url
  ecs_security_group                 = module.network.output_ecs_security_group
  public_subnets                     = ["${module.network.output_public_subnet_1a}", "${module.network.output_public_subnet_1b}"]
  tags                               = local.tags
  vpc_id                             = module.network.output_vpc
}

# Module for ALB
module "load_balancer" {
  source            = "./Modules/Services/ALB"
  lb_security_group = module.network.output_application_lb_security_group
  public_subnets    = ["${module.network.output_public_subnet_1a}", "${module.network.output_public_subnet_1b}"]
  vpc_id            = module.network.output_vpc
  container_port    = var.container_port
  tags              = local.tags
}

# Module for CloudWatch
module "cloudwatch" {
  source = "./Modules/Services/CloudWatch"
  tags   = local.tags
}

# Module for ECR
module "repository" {
  source = "./Modules/Services/ECR"
  tags   = local.tags
}