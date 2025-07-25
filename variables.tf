variable "region" {
  description = "Region where resources will be provided"
  type = string
  default = "us-east-1"
  validation {
    condition = contains(var.region,tolist("sa-east-1"))
    error_message = "You are lost in the sauce bruh"
  }
}
