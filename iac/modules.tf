module "ec2" {
  source        = "./modules/ec2"
  region        = var.region
  instance_ami  = var.ec2_instance_ami
  instance_type = var.ec2_instance_type
  volume_size   = var.ec2_volume_size
  volume_type   = var.ec2_volume_type
  allowed_ports = var.ec2_allowed_ports
}

module "dns" {
  source    = "./modules/route53"
  domain    = var.dns_domain
  records   = var.dns_records
  server_ip = module.ec2.instance_public_ip
}
