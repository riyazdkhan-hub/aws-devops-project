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

  description = "CIDR Block for VPC"

  type = string

}

############################################################
# Public Subnets
############################################################

variable "public_subnet_cidrs" {

  description = "Public Subnet CIDRs"

  type = list(string)

}

############################################################
# Private Subnets
############################################################

variable "private_subnet_cidrs" {

  description = "Private Subnet CIDRs"

  type = list(string)

}

############################################################
# EC2 Configuration
############################################################

variable "ami_id" {

  description = "Ubuntu 24.04 LTS AMI"

  type = string

}

variable "instance_type" {

  description = "EC2 Instance Type"

  type = string

}

variable "key_name" {

  description = "AWS Key Pair"

  type = string

}