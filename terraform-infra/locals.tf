locals {
  name_prefix = "${var.project_code}-${var.environment}"

  common_tags = {
    ProjectCode = var.project_code
    ProjectName = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}