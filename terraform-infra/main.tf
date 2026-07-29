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