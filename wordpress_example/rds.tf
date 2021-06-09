module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"
 
  identifier = "test" 
  engine = "mysql"
  engine_version = "5.7.19"
  instance_class = var.db_instance_class
  allocated_storage = var.allocated_storage

  name = var.db_name
  username = var.db_username
  password = var.db_password
  port = "3306"
  
  family = "mysql5.7"

  major_engine_version = "5.7"
  
  skip_final_snapshot = true
      
  subnet_ids = [module.vpc.database_subnets[0],module.vpc.database_subnets[1]]
  vpc_security_group_ids = [aws_security_group.db_sg.id]
}
