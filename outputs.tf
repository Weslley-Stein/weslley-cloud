output "instance_public_ip" {
  description = "Public IP attached to the EC2 instance"
  value       = module.ec2.instance_public_ip
}
