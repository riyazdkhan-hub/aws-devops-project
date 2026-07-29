#################################################
# Bootstrap Outputs
#################################################

output "terraform_state_bucket" {

  description = "Terraform State Bucket"

  value = aws_s3_bucket.terraform_state.bucket

}

output "terraform_lock_table" {

  description = "Terraform Lock Table"

  value = aws_dynamodb_table.terraform_lock.name

}

output "aws_region" {

  description = "AWS Region"

  value = var.aws_region

}

output "environment" {

  description = "Environment"

  value = var.environment

}