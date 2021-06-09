module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    
    name = var.vpc_name
    cidr = var.vpc_cidr
    azs = var.vpc_azs
    private_subnets = var.vpc_private_subnets
    public_subnets  = var.vpc_public_subnets
    database_subnets = var.vpc_database_subnets
    
    enable_nat_gateway = var.vpc_enable_nat_gateway
    create_igw = var.vpc_enable_internet_gateway

    create_database_subnet_group = true

    tags = var.vpc_tags
}

