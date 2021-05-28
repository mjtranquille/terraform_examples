variable "ec2_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default     = {
    Terraform   = "true"
    Environment = "development"
    Type        = "Monitoring"
  }
}

variable "aws_region" {
  description = "AWS region to deploy to"
  type = string

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}
