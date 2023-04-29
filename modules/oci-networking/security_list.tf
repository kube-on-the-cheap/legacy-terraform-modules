resource "oci_core_default_security_list" "default_regional_list" {
  manage_default_resource_id = oci_core_vcn.vcn.default_security_list_id

  display_name = format("%s VCN Security List", var.oci_networks_vcn_display_name)

  egress_security_rules {
    protocol    = "all" // TCP
    description = "Allow outbound"
    destination = "0.0.0.0/0"
  }
  ingress_security_rules {
    protocol    = "all"
    description = "Allow all inter-subnet traffic"
    source      = var.oci_networks_vcn_cidr
  }
}
