data "aws_ami" "ubuntu-22-04" {
  region      = var.region
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["^ubuntu/images/hvm-ssd/ubuntu-jammy-22\\.04-amd64-server-.*"]
  }

  filter {
    name   = "architecture"
    values = [x86_64]
  }

  filter {
    name   = "virtualization-type"
    values = [hvm]
  }

}

resource "aws_ec2_instance" "main" {
  ami = data.aws_ami.ubuntu-22-04

}
