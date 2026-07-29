#########################################
# AWS Region
#########################################

variable "aws_region" {

  description = "AWS Region"

  type = string

  default = "us-east-1"

}

#########################################
# Project Code
#########################################

variable "project_code" {

  description = "Project Code"

  type = string

  default = "786"

}

#########################################
# Project Name
#########################################

variable "project_name" {

  description = "Project Name"

  type = string

  default = "aws-devops-production-project"

}

#########################################
# Environment
#########################################

variable "environment" {

  description = "Deployment Environment"

  type = string

  default = "dev"

}

#########################################
# S3 Bucket Name
#########################################

variable "terraform_state_bucket" {

  description = "Terraform State Bucket"

  type = string

}

#########################################
# DynamoDB Table
#########################################

variable "terraform_lock_table" {

  description = "Terraform Lock Table"

  type = string

}