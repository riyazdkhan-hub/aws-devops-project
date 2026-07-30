############################################################
# Availability Zones
############################################################

data "aws_availability_zones" "available" {

  state = "available"

}

############################################################
# VPC Module
############################################################

module "vpc" {

  source = "./modules/vpc"

  aws_region = var.aws_region

  project_code = var.project_code

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs

  availability_zones = slice(
    data.aws_availability_zones.available.names,
    0,
    2
  )

}

############################################################
# Security Groups Module
############################################################

module "security_groups" {

  source = "./modules/security-groups"

  project_code = var.project_code

  project_name = var.project_name

  environment = var.environment

  vpc_id = module.vpc.vpc_id

}

############################################################
# EC2 Module
############################################################

module "ec2" {

  source = "./modules/ec2"

  project_code = var.project_code

  project_name = var.project_name

  environment = var.environment

  ami_id = var.ami_id

  instance_type = var.instance_type

  key_name = var.key_name

  public_subnet_id = module.vpc.public_subnet_ids[0]

  private_subnet_id = module.vpc.private_subnet_ids[0]

  jenkins_security_group_id = module.security_groups.jenkins_security_group_id

  ec2_security_group_id = module.security_groups.ec2_security_group_id

  instance_profile_name = module.iam.ec2_instance_profile_name

  root_volume_size = var.root_volume_size

  root_volume_type = var.root_volume_type

}

############################################################
# ALB Module
############################################################

module "alb" {

  source = "./modules/alb"

  project_code = var.project_code

  project_name = var.project_name

  environment = var.environment

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = module.vpc.public_subnet_ids

  alb_security_group_id = module.security_groups.alb_security_group_id

}

############################################################
# Auto Scaling Module
############################################################

module "autoscaling" {

  source = "./modules/autoscaling"

  project_code = var.project_code

  project_name = var.project_name

  environment = var.environment

  ami_id = var.ami_id

  instance_type = var.instance_type

  key_name = var.key_name

  root_volume_size = var.root_volume_size

  root_volume_type = var.root_volume_type

  private_subnet_ids = module.vpc.private_subnet_ids

  security_group_id = module.security_groups.ec2_security_group_id

  instance_profile_name = module.iam.ec2_instance_profile_name

  target_group_arn = module.alb.target_group_arn

  desired_capacity = 2

  min_size = 2

  max_size = 4

}

############################################################
# CloudWatch Module
############################################################

module "cloudwatch" {

  source = "./modules/cloudwatch"

  project_code = var.project_code

  project_name = var.project_name

  environment = var.environment

  autoscaling_group_name = module.autoscaling.autoscaling_group_name

}

############################################################
# Amazon ECR Module
############################################################

module "ecr" {

  source = "./modules/ecr"

  project_code = var.project_code

  project_name = var.project_name

  environment = var.environment

}