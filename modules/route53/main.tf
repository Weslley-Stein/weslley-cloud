resource "aws_route53_zone" "main" {
  name = var.domain
}

resource "aws_route53_record" "main" {
  for_each = {
    for record in var.records : record.record_name => record
  }
  zone_id = aws_route53_zone.main.id
  name    = each.value.record_name
  type    = each.value.type
  records = length(each.value.records) == 1 && each.value.records[0] == "" ? var.server_ip : each.value.records
  ttl     = 300
}
