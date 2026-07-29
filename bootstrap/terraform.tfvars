##############################################
# AWS Configuration
##############################################

aws_region = "us-east-1"

##############################################
# Project Configuration
##############################################

project_code = "786"

project_name = "aws-devops-production-project"

environment = "dev"

##############################################
# Terraform Backend
##############################################

# Replace ACCOUNT_ID with your AWS Account ID
# Example:
# 786-terraform-state-123456789012

terraform_state_bucket = "786-terraform-state-ACCOUNT_ID"

terraform_lock_table = "786-terraform-lock"