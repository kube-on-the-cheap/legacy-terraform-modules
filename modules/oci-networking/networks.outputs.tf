output "vcn_regional_subnet" {
  value = {
    (var.oci_region) = {
      "display_name" = resource.oci_core_subnet.vcn_regional_subnet.display_name
      "id"           = resource.oci_core_subnet.vcn_regional_subnet.id
    }
  }
}

output "vcn_ad_subnets" {
  value = { for ad, id in var.oci_availability_domains :
    ad => {
      "display_name" = oci_core_subnet.vcn_ad_subnets[ad].display_name
      "id"           = oci_core_subnet.vcn_ad_subnets[ad].id
    }
  }
}
