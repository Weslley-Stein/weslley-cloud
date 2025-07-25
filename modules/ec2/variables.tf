variable "region" {
  description = "region where resources will be provided."
  type        = string
  default     = "us-east-1"
  validation {
    condition     = var.region != "sa-east-1"
    error_message = "You are lost in the sauce bruh!"
  }
}

variable "allowed_instance_size" {
  description = "Instance allowed to be provided"
  type        = list(string)
  default     = ["nano", "micro", "small"]
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
