resource "digitalocean_domain" "domain" {
  count = var.create_domain ? 1 : 0
  name  = var.do_domain
}

data "digitalocean_domain" "domain" {
  count = var.create_domain ? 0 : 1
  name  = var.do_domain
}
