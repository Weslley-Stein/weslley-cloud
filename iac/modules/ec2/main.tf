locals {
  az           = "${var.region}a"
  project_name = "weslley-cloud"
}

#data "aws_ami" "ubuntu-22-04" {
#  most_recent = true
#  name_regex  = "^ubuntu/images/hvm-ssd/ubuntu-jammy-22\\.04-amd64-server-.*"
#  owners      = ["099720109477"]
#
#  filter {
#    name   = "architecture"
#    values = ["x86_64"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#
#}

resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "main" {
  key_name   = "${local.project_name}-key"
  public_key = tls_private_key.main.public_key_openssh
}

resource "aws_security_group" "main" {
  name = "${local.project_name}-main"

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "main" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  availability_zone      = local.az
  key_name               = aws_key_pair.main.id
  vpc_security_group_ids = [aws_security_group.main.id]
  root_block_device {
    delete_on_termination = false
    encrypted             = true
    volume_size           = var.volume_size
    volume_type           = var.volume_type
  }
}

resource "aws_eip" "main" {
  instance = aws_instance.main.id
  tags = {
    Name = "weslley.cloud"
  }
}

resource "aws_s3_object" "instance_key" {
  bucket                 = "weslley-cloud-terraform"
  key                    = "terraform/keys/weslley-cloud.pem"
  content                = tls_private_key.main.private_key_pem
  server_side_encryption = "AES256"
}
