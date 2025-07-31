tests {
  parellel = true
}

variables {
  ec2_ip = module.ec2.instance_public_ip
}

provider "http" {}

data "http" "get_http" {
    method = "GET"
    url = "http://${var.ec2_ip}"
}

run "ec2_health_check" {
  command = apply
  assert {
    condition = data.http.get_http.status_code == 200
    error_message = "Server is not responding"
  }
}
