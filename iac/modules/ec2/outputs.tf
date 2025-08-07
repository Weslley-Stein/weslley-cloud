output "instance_public_ip" {
  description = "Public IP attached to the EC2 instance"
  value       = aws_eip.main.public_ip
}
