############################################################
# Jenkins EC2 Outputs
############################################################

output "jenkins_instance_id" {

  description = "Jenkins EC2 Instance ID"

  value = aws_instance.jenkins.id

}

output "jenkins_public_ip" {

  description = "Jenkins Public IP"

  value = aws_instance.jenkins.public_ip

}

