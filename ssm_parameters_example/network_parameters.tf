resource "aws_ssm_parameter" "vpc_id" {
  name  = "/development/network/vpc_id"
  type  = "String"
  value = var.vpc_id
}

resource "aws_ssm_parameter" "sg_id" {
  name  = "/development/network/sg_id"
  type  = "String"
  value = var.sg_id
}

resource "aws_ssm_parameter" "public_subnet_id" {
  name  = "/development/network/public_subnet_id"
  type  = "String"
  value = var.public_subnet_id
}
