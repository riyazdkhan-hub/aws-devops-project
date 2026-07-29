############################################################
# Local Values
############################################################

locals {

  name_prefix = "${var.project_code}-${var.environment}"

}

############################################################
# ALB Security Group
############################################################

resource "aws_security_group" "alb" {

  name        = "${local.name_prefix}-alb-sg"

  description = "Application Load Balancer Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "HTTP"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    description = "HTTPS"

    from_port = 443

    to_port = 443

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "${local.name_prefix}-alb-sg"

  }

}

############################################################
# EC2 Security Group
############################################################

resource "aws_security_group" "ec2" {

  name = "${local.name_prefix}-ec2-sg"

  description = "Application EC2 Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "Application Traffic"

    from_port = 3000

    to_port = 3000

    protocol = "tcp"

    security_groups = [
      aws_security_group.alb.id
    ]

  }

  ingress {

    description = "SSH From Jenkins"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    security_groups = [
      aws_security_group.jenkins.id
    ]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "${local.name_prefix}-ec2-sg"

  }

}

############################################################
# Jenkins Security Group
############################################################

resource "aws_security_group" "jenkins" {

  name = "${local.name_prefix}-jenkins-sg"

  description = "Jenkins Server Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "SSH"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    description = "Jenkins"

    from_port = 8080

    to_port = 8080

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "${local.name_prefix}-jenkins-sg"

  }

}