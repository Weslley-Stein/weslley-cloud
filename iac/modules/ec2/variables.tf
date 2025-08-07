#---ACCOUNT CONFIG---#
variable "region" {
  description = "region where resources will be provided."
  type        = string
  default     = "us-east-1"
  validation {
    condition     = var.region != "sa-east-1"
    error_message = "You are lost in the sauce bruh!"
  }
}

#---INSTANCE CONFIG---#
variable "allowed_instance_size" {
  description = "Instance allowed to be provided"
  type        = list(string)
  default     = ["nano", "micro", "small"]
}

variable "instance_ami" {
  description = "ami id for the ec2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance family and model"
  type        = string
  default     = "t3.micro"
  validation {
    condition     = contains([for size in var.allowed_instance_size : strcontains(var.instance_type, size)], true)
    error_message = "That instance is too big!"
  }
}


#---VOLUME CONFIG---#
variable "volume_size" {
  description = "Disk size of the instance."
  type        = number
  default     = 30
}

variable "volume_type" {
  description = "Volume type of the instance."
  type        = string
  default     = "gp3"
}

#---SECURITY GROUPS---#
variable "allowed_ports" {
  description = "Determine which ports are allowed to receive traffic."
  type        = list(map(string))
}
