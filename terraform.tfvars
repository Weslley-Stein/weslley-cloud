region = "us-east-1"

ec2_instance_ami = "ami-09ac0b140f63d3458"

ec2_instance_type = "t3.small"

ec2_volume_size = 30

ec2_volume_type = "gp3"

ec2_allowed_ports = [
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

dns_domain = "weslley.cloud"

dns_records = [
  {
    record_name = "weslley.cloud"
    type        = "A"
    records     = [""]
  },
  {
    record_name = "n8n.weslley.cloud"
    type        = "A"
    records     = [""]
  }
]
