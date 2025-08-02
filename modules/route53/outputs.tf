output "route53_root_domain" {
  description = "Root domain of the hosted zone."
  value       = aws_route53_zone.main.name
}
