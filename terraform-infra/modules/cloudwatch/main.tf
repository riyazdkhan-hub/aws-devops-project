############################################################
# Local Values
############################################################

locals {

  name_prefix = "${var.project_code}-${var.environment}"

}

############################################################
# CloudWatch Log Group
############################################################

resource "aws_cloudwatch_log_group" "application" {

  name = "/aws/${local.name_prefix}/application"

  retention_in_days = 30

  tags = {

    Name = "${local.name_prefix}-logs"

    Project = var.project_name

    Environment = var.environment

    ManagedBy = "Terraform"

  }

}

############################################################
# CloudWatch Dashboard
############################################################

resource "aws_cloudwatch_dashboard" "application" {

  dashboard_name = "${local.name_prefix}-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {

        "type" : "metric",

        "x" : 0,

        "y" : 0,

        "width" : 12,

        "height" : 6,

        "properties" : {

          "metrics" : [

            [

              "AWS/AutoScaling",

              "GroupDesiredCapacity",

              "AutoScalingGroupName",

              var.autoscaling_group_name

            ],

            [

              ".",

              "GroupInServiceInstances",

              ".",

              "."

            ]

          ],

          "period" : 300,

          "stat" : "Average",

          "region" : "us-east-1",

          "title" : "Auto Scaling Group Status"

        }

      }

    ]

  })

}

############################################################
# CPU Alarm
############################################################

resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name = "${local.name_prefix}-high-cpu"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 80

  alarm_description = "High CPU Utilization"

  treat_missing_data = "missing"

}

############################################################
# Status Check Alarm
############################################################

resource "aws_cloudwatch_metric_alarm" "status_check" {

  alarm_name = "${local.name_prefix}-status-check"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "StatusCheckFailed"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Maximum"

  threshold = 1

  alarm_description = "EC2 Status Check Failed"

  treat_missing_data = "missing"

}