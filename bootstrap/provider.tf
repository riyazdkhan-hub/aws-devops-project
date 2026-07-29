provider "aws" {

  region = var.aws_region

  default_tags {

    tags = {

      ProjectCode = var.project_code
      ProjectName = var.project_name
      Environment = var.environment

      Owner       = "Riyaz Khan"
      ManagedBy   = "Terraform"

      Repository  = "aws-devops-production-project"

    }

  }

}