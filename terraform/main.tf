
resource "aws_instance" "strapi" {
  ami           = "ami-0f58b397bc5c1f2e8" # Replace with your preferred AMI ID
  instance_type = var.instance_type
  key_name      = var.key_name




  tags = {
    Name = "StrapiServer_via_terraform_let"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash",
      "sudo apt install -y nodejs",
      "npm install",
      "sudo npm install -g yarn",
      "sudo npm install -g strapi",
      "sudo npm install pm2 -g",
      "sudo mkdir -p /home/ubuntu/srv/strapi",
      "sudo chown -R ubuntu:ubuntu /home/ubuntu/srv/strapi",
      "cd /home/ubuntu/srv/strapi",
      "git clone https://github.com/leticia2983/Strapi_app_terraform.git",


    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = var.key_name
      host        = self.public_ip

    }
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
