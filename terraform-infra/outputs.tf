############################################################
# Root Module Outputs
############################################################

output "vpc_id" {

  description = "VPC ID"

  value = module.vpc.vpc_id

}

output "public_subnet_ids" {

  description = "Public Subnet IDs"

  value = module.vpc.public_subnet_ids

}

output "private_subnet_ids" {

  description = "Private Subnet IDs"

  value = module.vpc.private_subnet_ids

}

output "internet_gateway_id" {

  description = "Internet Gateway ID"

  value = module.vpc.internet_gateway_id

}

output "nat_gateway_id" {

  description = "NAT Gateway ID"

  value = module.vpc.nat_gateway_id

}

############################################################
# Security Group Outputs
############################################################

output "alb_security_group_id" {

  description = "ALB Security Group ID"

  value = module.security_groups.alb_security_group_id

}

output "ec2_security_group_id" {

  description = "EC2 Security Group ID"

  value = module.security_groups.ec2_security_group_id

}

output "jenkins_security_group_id" {

  description = "Jenkins Security Group ID"

  value = module.security_groups.jenkins_security_group_id

}