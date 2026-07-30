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

  disable_api_termination = true

  root_block_device {

  volume_size = var.root_volume_size

  volume_type = var.root_volume_type

  encrypted = true

  delete_on_termination = true

  }
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

  root_block_device {

  volume_size = var.root_volume_size

  volume_type = var.root_volume_type

  encrypted = true

  delete_on_termination = true

  }
  tags = {

    Name = "${local.name_prefix}-application"

  }

}