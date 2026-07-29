############################################################
# Local Values
############################################################

locals {

  name_prefix = "${var.project_code}-${var.environment}"

}

############################################################
# Jenkins EC2 Instance
############################################################

resource "aws_instance" "jenkins" {

  ami                         = var.ami_id

  instance_type               = var.instance_type

  subnet_id                   = var.public_subnet_id

  key_name                    = var.key_name

  vpc_security_group_ids       = [
    var.jenkins_security_group_id
  ]

  iam_instance_profile         = var.instance_profile_name

  associate_public_ip_address  = true

  tags = {

    Name = "${local.name_prefix}-jenkins"

  }

}

############################################################
# Application EC2 Instance
############################################################

resource "aws_instance" "application" {

  ami                         = var.ami_id

  instance_type               = var.instance_type

  subnet_id                   = var.private_subnet_id

  key_name                    = var.key_name

  vpc_security_group_ids       = [
    var.ec2_security_group_id
  ]

  iam_instance_profile         = var.instance_profile_name

  associate_public_ip_address  = false

  tags = {

    Name = "${local.name_prefix}-application"

  }

}