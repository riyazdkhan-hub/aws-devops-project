############################################################
# CloudWatch Outputs
############################################################

output "log_group_name" {

  description = "CloudWatch Log Group Name"

  value = aws_cloudwatch_log_group.application.name

}

output "dashboard_name" {

  description = "CloudWatch Dashboard Name"

  value = aws_cloudwatch_dashboard.application.dashboard_name

}

output "cpu_alarm_name" {

  description = "CPU Alarm Name"

  value = aws_cloudwatch_metric_alarm.high_cpu.alarm_name

}

output "status_check_alarm_name" {

  description = "Status Check Alarm Name"

  value = aws_cloudwatch_metric_alarm.status_check.alarm_name

}