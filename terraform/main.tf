
resource "aws_instance" "strapi" {
  ami           = "ami-0f58b397bc5c1f2e8" # Replace with your preferred AMI ID
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_id = var.vpc_id
  vpc_security_group_ids = var.sg_id


  tags = {
    Name = "StrapiServer_via_terraform_let"
  }


  lifecycle {
    create_before_destroy = true
  }

  provisioner "local-exec" {
    command = "echo '${aws_instance.strapi.public_ip}' > ip_address.txt"
  }

}
output "instance_public_ip" {
value = aws_instance.strapi.public_ip
}

resource "aws_security_group" "strapi_sg" {
  name = "strapi-sg"
  description = "Security group for Strapi instance"
  vpc_id      = var.vpc_id  # Ensure you have a valid VPC ID

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "strapi-sg"
  }
}