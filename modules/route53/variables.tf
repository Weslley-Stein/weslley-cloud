variable "vpc_id" {
  description = "ID of the vpc that the hosted zone will be attached to"
  type        = string
}

variable "domain" {
  description = "Root domain for the project"
  type        = string
}

variable "records" {
  description = "All records within the hosted zone"
  type        = list(map(map))
  # "record_name" = {
  #   type = ""
  #   records = [""]
  # }
}
