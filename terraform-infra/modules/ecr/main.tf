locals {

  repository_name = "${var.project_code}-${var.environment}"

}

resource "aws_ecr_repository" "application" {

  name = local.repository_name

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {

    scan_on_push = true

  }

  tags = {

    Name = local.repository_name

    Project = var.project_name

    Environment = var.environment

    ManagedBy = "Terraform"

  }

}