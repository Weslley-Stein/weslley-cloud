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

variable "server_ip" {
  description = "Server Public IP"
  type        = string
}
