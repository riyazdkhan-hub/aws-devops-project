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
# Launch Template
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

############################################################
# Storage
############################################################

variable "root_volume_size" {

  description = "Root Volume Size"

  type = number

}

variable "root_volume_type" {

  description = "Root Volume Type"

  type = string

}

############################################################
# Networking
############################################################

variable "private_subnet_ids" {

  description = "Private Subnet IDs"

  type = list(string)

}

############################################################
# Security Group
############################################################

variable "ec2_security_group_id" {

  description = "Application Security Group"

  type = string

}

############################################################
# IAM
############################################################

variable "instance_profile_name" {

  description = "IAM Instance Profile"

  type = string

}

############################################################
# Target Group
############################################################

variable "target_group_arn" {

  description = "ALB Target Group ARN"

  type = string

}

############################################################
# Auto Scaling
############################################################

variable "desired_capacity" {

  description = "Desired Capacity"

  type = number

}

variable "min_size" {

  description = "Minimum Instances"

  type = number

}

variable "max_size" {

  description = "Maximum Instances"

  type = number

}