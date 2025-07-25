data "aws_ami" "ubuntu-22-04" {
  most_recent = true
  name_regex  = "^ubuntu/images/hvm-ssd/ubuntu-jammy-22\\.04-amd64-server-.*"
  owners      = ["099720109477"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "main" {
  ami           = data.aws_ami.ubuntu-22-04
  instance_type = var.instance_type
}
