output "instance_public_ip" {
  description = "Public IP attached to the EC2 instance"
  value       = module.ec2.instance_public_ip
}

output "dns_root_domain" {
  description = "Root domain of the hosted zone id."
  value       = module.dns.route53_root_domain
}
