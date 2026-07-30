############################################################
# Local Values
############################################################

locals {

  name_prefix = "${var.project_code}-${var.environment}"

}

############################################################
# Launch Template
############################################################

resource "aws_launch_template" "app" {

  name_prefix = "${local.name_prefix}-lt-"

  image_id = var.ami_id

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  iam_instance_profile {

    name = var.instance_profile_name

  }

  block_device_mappings {

    device_name = "/dev/sda1"

    ebs {

      volume_size = var.root_volume_size

      volume_type = var.root_volume_type

      encrypted = true

      delete_on_termination = true

    }

  }

  monitoring {

    enabled = true

  }

  tag_specifications {

    resource_type = "instance"

    tags = {

      Name = "${local.name_prefix}-application"

      Project = var.project_name

      Environment = var.environment

      ManagedBy = "Terraform"

    }

  }

}

############################################################
# Auto Scaling Group
############################################################

resource "aws_autoscaling_group" "app" {

  name = "${local.name_prefix}-asg"

  min_size = var.min_size

  max_size = var.max_size

  desired_capacity = var.desired_capacity

  health_check_type = "ELB"

  health_check_grace_period = 300

  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [
    var.target_group_arn
  ]

  launch_template {

    id = aws_launch_template.app.id

    version = "$Latest"

  }

  tag {

    key = "Name"

    value = "${local.name_prefix}-application"

    propagate_at_launch = true

  }

  tag {

    key = "Project"

    value = var.project_name

    propagate_at_launch = true

  }

  tag {

    key = "Environment"

    value = var.environment

    propagate_at_launch = true

  }

  lifecycle {

    create_before_destroy = true

  }

}