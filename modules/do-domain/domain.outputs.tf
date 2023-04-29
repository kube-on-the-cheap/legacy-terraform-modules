data "digitalocean_records" "ns_records" {
  count  = var.create_domain ? 1 : 0
  domain = one(digitalocean_domain.domain.*.name)
  filter {
    key    = "type"
    values = ["NS"]
  }
}

output "do_ns_records" {
  description = "The delegation to set in the parent zone."
  value       = data.digitalocean_records.ns_records
}
