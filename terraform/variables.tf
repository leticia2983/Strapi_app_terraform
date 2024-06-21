variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default     = "aws_login"
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "sg_id" {
  description = "The security_group ID where the security group will be created"
  type        = string
}