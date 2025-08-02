variable "region" {
  description = "Region where resources will be provided"
  type        = string
  default     = "us-east-1"
  validation {
    condition     = var.region != "sa-east-1"
    error_message = "You are lost in the sauce bruh"
  }
}

variable "ec2_instance_type" {
  description = "Instance type for the server."
  type        = string
  default     = "t3.micro"
}

variable "ec2_volume_size" {
  description = "Disk size of the instance."
  type        = number
  default     = 30
}

variable "ec2_volume_type" {
  description = "EBS volume type of the instance."
  type        = string
  default     = "gp3"
}

variable "ec2_allowed_ports" {
  description = "Inboud traffic allowed on the server."
  type        = list(map(string))
}

variable "dns_domain" {
  description = "Root domain of the server."
  type        = string
}

variable "dns_records" {
  description = "Domains for the server."
  type = list(object({
    record_name = string
    type        = string
    records     = list(string)
  }))
}
