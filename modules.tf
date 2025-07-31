module "ec2" {
  source        = "./modules/ec2"
  region        = "us-east-1"
  instance_type = "t3.small"
  volume_size   = 30
  volume_type   = "gp3"
  allowed_ports = [
    {
      from_port = "443"
      to_port   = "443"
      procotol  = "tcp"
    },
    {
      from_port = "80"
      to_port   = "80"
      protocol  = "tcp"
    },
    {
      from_port = "22"
      to_port   = "22"
      protocol  = "tcp"
    }
  ]
}
