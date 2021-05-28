resource "aws_ssm_parameter" "ubuntu_ami_id" {
  name  = "/development/ec2/ubuntu/current_lts_ami"
  type  = "String"
  value = var.ubuntu_lts_ami
}

resource "aws_ssm_parameter" "webserver_ip" {
  name  = "/development/ec2/web/webserver_ip"
  type  = "String"
  value = var.webserver_ip
}




