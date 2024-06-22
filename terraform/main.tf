
resource "aws_instance" "strapi" {
  ami           = "ami-04b70fa74e45c3917" # Replace with your preferred AMI ID
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = file("user_data.sh")

  tags = {
    Name = "StrapiServer_via_terraform_east_us_let_t2.small"
  }


  }




  output "instance_public_ip" {
    value = aws_instance.strapi.public_ip
  }

#resource "aws_security_group" "strapi_sg" {
#  name = "strapi-sg"
#  description = "Security group for Strapi instance"
#  vpc_id      = var.vpc_id  # Ensure you have a valid VPC ID
#
#  ingress {
#    from_port   = 1337
#    to_port     = 1337
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  tags = {
#    Name = "strapi-sg"
#  }
#}
