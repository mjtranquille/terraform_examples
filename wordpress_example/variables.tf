variable "region" {
  description = "aws region"
  default = "us-east-1"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}
variable "vpc_name" {
    type = string
    default = "testvpc"
}
variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_database_subnets" {
  description = "database subnets for VPC"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
}


variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type    = bool
  default = false
}

variable "vpc_enable_internet_gateway" {
  description = "Enable Internet Gateway for VPC"
  type = bool
  default = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default     = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "db_instance_class" {
  description = "instance class for RDS instance"
  type = string
  default = "db.t2.large"
}

variable "db_name" {
  description = "name of database"
  type = string
  default = "test"
}

variable "db_username" {
  description = "database username"
  type = string
  default = "test"
}

variable "db_password" {
  description = "database password"
  type = string
  default = "pleasechang3mE"
}

variable "allocated_storage" {
  description = "allocated storage for db instance"
  type = string
  default = 5
}

variable "image_id" {
  description = "AMI Id"
  type = string
  default = "ami-1234567890"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3.micro"
}
