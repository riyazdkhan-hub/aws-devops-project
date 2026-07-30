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
# EC2 Configuration
############################################################

variable "ami_id" {

  description = "Amazon Machine Image ID"

  type = string

}

variable "instance_type" {

  description = "EC2 Instance Type"

  type = string

}

variable "key_name" {

  description = "AWS Key Pair Name"

  type = string

}

############################################################
# Networking
############################################################

variable "public_subnet_id" {

  description = "Public Subnet ID"

  type = string

}

variable "private_subnet_id" {

  description = "Private Subnet ID"

  type = string

}

############################################################
# Security Groups
############################################################

variable "jenkins_security_group_id" {

  description = "Jenkins Security Group"

  type = string

}

variable "ec2_security_group_id" {

  description = "Application EC2 Security Group"

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
# Root Volume Configuration
############################################################

variable "root_volume_size" {

  description = "Root EBS Volume Size (GB)"

  type = number

}

variable "root_volume_type" {

  description = "Root EBS Volume Type"

  type = string

}