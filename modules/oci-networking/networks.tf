resource "oci_core_vcn" "vcn" {
  compartment_id = var.oci_compartment_id

  cidr_blocks  = [var.oci_networks_vcn_cidr]
  display_name = var.oci_networks_vcn_display_name
  dns_label    = var.oci_networks_vcn_dns_label
}

resource "oci_core_subnet" "vcn_regional_subnet" {
  compartment_id = var.oci_compartment_id

  vcn_id            = oci_core_vcn.vcn.id
  cidr_block        = cidrsubnet(one(oci_core_vcn.vcn.cidr_blocks), 4, 0)
  display_name      = format("%s-%s-regional-subnet", data.oci_identity_compartment.compartment.name, var.oci_region)
  security_list_ids = [oci_core_vcn.vcn.default_security_list_id]

}

resource "oci_core_subnet" "lb_regional_subnets" {
  count = 2

  compartment_id = var.oci_compartment_id

  vcn_id            = oci_core_vcn.vcn.id
  cidr_block        = cidrsubnet(one(oci_core_vcn.vcn.cidr_blocks), 4, count.index + 1)
  display_name      = format("%s-%s-regional-subnet-lb-%s", data.oci_identity_compartment.compartment.name, var.oci_region, count.index + 1)
  security_list_ids = [oci_core_vcn.vcn.default_security_list_id]

}

resource "oci_core_subnet" "vcn_ad_subnets" {
  for_each = var.oci_availability_domains

  compartment_id = var.oci_compartment_id

  vcn_id            = oci_core_vcn.vcn.id
  cidr_block        = cidrsubnet(one(oci_core_vcn.vcn.cidr_blocks), 4, index(keys(var.oci_availability_domains), each.key) + 3)
  display_name      = format("%s-%s-subnet", data.oci_identity_compartment.compartment.name, lower(split(":", each.key)[1]))
  security_list_ids = [oci_core_vcn.vcn.default_security_list_id]
}
