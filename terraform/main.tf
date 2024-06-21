
resource "aws_instance" "strapi" {
  ami           = "ami-0f58b397bc5c1f2e8" # Replace with your preferred AMI ID
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_vpc.vpc-let.id]


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