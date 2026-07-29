############################################################
# AWS Region
############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}

############################################################
# Project Code
############################################################

variable "project_code" {

  description = "Project Code"

  type = string

}

############################################################
# Project Name
############################################################

variable "project_name" {

  description = "Project Name"

  type = string

}

############################################################
# Environment
############################################################

variable "environment" {

  description = "Deployment Environment"

  type = string

}

############################################################
# VPC CIDR
############################################################

variable "vpc_cidr" {

  description = "VPC CIDR Block"

  type = string

}

############################################################
# Public Subnet CIDRs
############################################################

variable "public_subnet_cidrs" {

  description = "Public Subnet CIDRs"

  type = list(string)

}

############################################################
# Private Subnet CIDRs
############################################################

variable "private_subnet_cidrs" {

  description = "Private Subnet CIDRs"

  type = list(string)

}

############################################################
# Availability Zones
############################################################

variable "availability_zones" {

  description = "Availability Zones"

  type = list(string)

}