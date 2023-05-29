
module "subnet_addrs" {
  source  = "hashicorp/subnets/cidr"
  version = "1.0.0"

  base_cidr_block = var.oci_networks_vcn_cidr
  networks = concat(
    [
      {
        name     = "regional"
        new_bits = 4
      }
    ],
    [for name, id in var.oci_availability_domains : { "name" = name, "new_bits" = 6 }]
  )
}


resource "oci_core_vcn" "vcn" {
  compartment_id = var.oci_compartment_id

  cidr_blocks   = [var.oci_networks_vcn_cidr]
  display_name  = var.oci_networks_vcn_display_name
  dns_label     = var.oci_networks_vcn_dns_label
  freeform_tags = var.shared_freeform_tags
}

resource "oci_core_subnet" "vcn_regional_subnet" {
  compartment_id = var.oci_compartment_id

  vcn_id            = oci_core_vcn.vcn.id
  cidr_block        = module.subnet_addrs.network_cidr_blocks["regional"]
  display_name      = format("%s-%s-regional-subnet", data.oci_identity_compartment.compartment.name, var.oci_region)
  security_list_ids = [oci_core_vcn.vcn.default_security_list_id]
  freeform_tags     = var.shared_freeform_tags
}

resource "oci_core_subnet" "vcn_ad_subnets" {
  for_each = var.oci_availability_domains

  compartment_id = var.oci_compartment_id

  availability_domain = each.key
  vcn_id              = oci_core_vcn.vcn.id
  cidr_block          = module.subnet_addrs.network_cidr_blocks[each.key]
  display_name        = format("%s-%s-subnet", data.oci_identity_compartment.compartment.name, lower(split(":", each.key)[1]))
  security_list_ids   = [oci_core_vcn.vcn.default_security_list_id]
  freeform_tags       = var.shared_freeform_tags
}
