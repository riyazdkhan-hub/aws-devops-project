############################################################
# Local Values
############################################################

locals {

  name_prefix = "${var.project_code}-${var.environment}"

}

############################################################
# Application Load Balancer
############################################################

resource "aws_lb" "application" {

  name               = "${local.name_prefix}-alb"

  internal           = false

  load_balancer_type = "application"

  security_groups = [
    var.alb_security_group_id
  ]

  subnets = var.public_subnet_ids

  enable_deletion_protection = true

  tags = {

    Name = "${local.name_prefix}-alb"

  }

}

############################################################
# Target Group
############################################################

resource "aws_lb_target_group" "application" {

  name = "${local.name_prefix}-tg"

  port = 3000

  protocol = "HTTP"

  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2

  }

  tags = {

    Name = "${local.name_prefix}-tg"

  }

}

############################################################
# HTTP Listener
############################################################

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.application.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.application.arn

  }

}