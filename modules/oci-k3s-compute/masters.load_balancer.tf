# Variables
variable "oci_network_security_groups" {
  type        = map(any)
  description = "A map of available Network Security Groups"
}

variable "oci_lb_additional_subnet_ids" {
  type        = list(string)
  description = "A list of additional subnets that will be part of the Load Balancer"
  default     = []
}

# Resources
resource "oci_load_balancer_listener" "k3s_api_server_listener" {
  count = local.is_master ? 1 : 0

  default_backend_set_name = one(oci_load_balancer_backend_set.masters_backend_set[*].name)
  load_balancer_id         = one(oci_load_balancer_load_balancer.k3s_apiserver_load_balancer[*].id)
  name                     = "k3s_api_server"
  port                     = 6443
  protocol                 = "TCP"

  connection_configuration {
    idle_timeout_in_seconds = 10
  }
}

resource "oci_load_balancer_backend_set" "masters_backend_set" {
  count = local.is_master ? 1 : 0

  health_checker {
    protocol          = "TCP"
    interval_ms       = 10000
    timeout_in_millis = 3000
    port              = 6443
    retries           = 3
  }
  load_balancer_id = one(oci_load_balancer_load_balancer.k3s_apiserver_load_balancer[*].id)
  name             = "k3s-masters"
  policy           = "LEAST_CONNECTIONS"
}

resource "oci_load_balancer_load_balancer" "k3s_apiserver_load_balancer" {
  count = local.is_master ? 1 : 0

  compartment_id = var.oci_compartment_id
  freeform_tags  = merge(var.shared_freeform_tags, local.compute_freeform_tags)

  display_name = "k3s_apiserver_load_balancer"
  shape        = "flexible"
  subnet_ids   = concat([var.oci_vcn_subnet_id], var.oci_lb_additional_subnet_ids)

  ip_mode                    = "IPV4"
  is_private                 = false
  network_security_group_ids = [var.oci_network_security_groups.permit_apiserver]

  shape_details {
    maximum_bandwidth_in_mbps = 10
    minimum_bandwidth_in_mbps = 10
  }
}
