resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.oci_compartment_id

  vcn_id  = oci_core_vcn.vcn.id
  enabled = true
}

resource "oci_core_default_route_table" "internet_route_table" {
  compartment_id = var.oci_compartment_id

  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id

  route_rules {
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}
