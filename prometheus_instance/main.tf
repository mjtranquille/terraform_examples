terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
  
}

data "aws_ssm_parameter" "ami_id" {
  name = "/development/ec2/ubuntu/current_lts_ami"
}

data "aws_ssm_parameter" "sg_id" {
  name = "/development/network/sg_id"
}

data "aws_ssm_parameter" "subnet_id" {
  name = "/development/network/public_subnet_id"
}
 
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"
  ami = data.aws_ssm_parameter.ami_id.value
  iam_instance_profile = aws_iam_instance_profile.prometheus_profile.id
  instance_type = var.instance_type
  name = "prometheus"
  subnet_id = data.aws_ssm_parameter.subnet_id.value 
  vpc_security_group_ids = [data.aws_ssm_parameter.sg_id.value]
  key_name = var.key_name
  tags = var.ec2_tags
}


