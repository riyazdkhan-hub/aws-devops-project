############################################################
# Project Information
############################################################

variable "project_code" {

  description = "Project Code"

  type = string

}

variable "project_name" {

  description = "Project Name"

  type = string

}

variable "environment" {

  description = "Deployment Environment"

  type = string

}

############################################################
# Networking
############################################################

variable "vpc_id" {

  description = "VPC ID"

  type = string

}

variable "public_subnet_ids" {

  description = "Public Subnet IDs"

  type = list(string)

}

############################################################
# Security Group
############################################################

variable "alb_security_group_id" {

  description = "ALB Security Group ID"

  type = string

}
