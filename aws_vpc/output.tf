output "vpc_id" {
    value = module.vpc.vpc_id
}
output "subnet_ids_public" {
    value = module.vpc.public_subnets
}
output "subnet_ids_private" {
    value = module.vpc.private_subnets
}

output "sg_id" {
    value = aws_security_group.base_sg.id
}

