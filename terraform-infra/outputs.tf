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