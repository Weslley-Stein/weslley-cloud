data "aws_vpc" "main" {
  id = var.vpc_id
}

resource "aws_route53_zone" "main" {
  name = var.domain
  vpc {
    vpc_id = data.aws_vpc.main.id
  }
}

resource "aws_route53_record" "main" {
  for_each = var.records
  zone_id  = aws_route53_zone.main.id
  name     = each.value.record_name
  type     = each.value.type
  records  = each.value.records
}
