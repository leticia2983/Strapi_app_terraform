variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  default     = "t2.medium"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default     ="let_useast__login"
}
#
#variable "vpc_id" {
#  description = "The VPC ID where the security group will be created"
#  type        = string
#  default = "vpc-0bf60a83999950650"
#}
#
#variable "sg_id" {
#  description = "The security_group ID where the security group will be created"
#  type        = string
#  default = "sg-0728132af8b28603a"
#}
