#resource "aws_vpc" "vpc-let" {
#  cidr_block           = "10.0.0.0/16"
#  instance_tenancy     = "default"
#  enable_dns_hostnames = true
#}
#
#resource "aws_subnet" "sn1" {
#  cidr_block              = "10.0.1.0/24"
#  vpc_id                  = aws_vpc.vpc-let.id
#  availability_zone       = "ap-south-1a"
#  map_public_ip_on_launch = true
#}
#
#
#resource "aws_internet_gateway" "gw" {
#  vpc_id = aws_vpc.vpc-let.id
#}
#
#resource "aws_route_table" "rt" {
#  vpc_id = aws_vpc.vpc-let.id
#
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.gw.id
#  }
#}
#  resource "aws_route_table_association" "route1" {
#    route_table_id = aws_route_table.rt.id
#    subnet_id      = aws_subnet.sn1.id
#  }
