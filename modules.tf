module "ec2" {
  source = "./modules/ec2"
  region = "us-east-1"
  instance_type = "t3.small"
}
