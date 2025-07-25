variable "region" {
  description = "region where resources will be provided."
  type        = string
  default     = "us-east-1"
  validation {
    condition     = var.region != "sa-east-1"
    error_message = "You are lost in the sauce bruh!"
  }
}

variable "allowed_instances_size" {
  description = "Instance allowed to be provided"
  type = list(string)
  default = ["nano","micro","small"]
}

variable "instance_type" {
  description = "EC2 instance family and model"
  type = string
  default = "t3.micro"
  validation {
    condition = [for size in var.allowd_instances_sizes : strcontains(var.instance_type, size)]
    error_message = "That instance is too big!"
  }
}
