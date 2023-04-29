resource "digitalocean_record" "a_records" {
  for_each = local.a_records

  type   = "A"
  domain = var.create_domain ? one(digitalocean_domain.domain.*.id) : one(data.digitalocean_domain.domain.*.id)
  name   = each.value.name
  value  = each.value.value
  ttl    = lookup(each.value, "ttl", "3600")
}

resource "digitalocean_record" "cname_records" {
  for_each = local.cname_records

  type   = "CNAME"
  domain = var.create_domain ? one(digitalocean_domain.domain.*.id) : one(data.digitalocean_domain.domain.*.id)
  name   = each.value.name
  value  = substr(each.value.value, -1, length(each.value.value)) == "." ? each.value.value : format("%s.", each.value.value)
  ttl    = lookup(each.value, "ttl", "3600")
}

resource "digitalocean_record" "ns_records" {
  for_each = local.ns_records

  type   = "NS"
  domain = var.create_domain ? one(digitalocean_domain.domain.*.id) : one(data.digitalocean_domain.domain.*.id)
  name   = each.value.name
  value  = substr(each.value.value, -1, length(each.value.value)) == "." ? each.value.value : format("%s.", each.value.value)
  ttl    = lookup(each.value, "ttl", "3600")
}
