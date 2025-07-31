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
  type = list(object({
    record_name = string
    type        = string
    records     = list(string)
  }))
}
