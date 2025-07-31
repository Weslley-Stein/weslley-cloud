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
      protocol  = "tcp"
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

module "dns" {
  source = "./modules/route53"
  vpc_id = "vpc-0bea2169ef5068588"
  domain = "weslley.cloud"
  records = [
    {
      "weslley.cloud" = {
        type    = "A"
        records = [module.ec2.instance_public_ip]
      }
    }
  ]
}
