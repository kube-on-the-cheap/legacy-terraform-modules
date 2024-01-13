output "vcn_regional_subnet" {
  value = {
    (var.oci_region) = {
      (resource.oci_core_subnet.vcn_regional_subnet.display_name) : resource.oci_core_subnet.vcn_regional_subnet.id
    }
  }
}

output "vcn_regional_subnets_lbs" {
  value = {
    (var.oci_region) = { for subnet in oci_core_subnet.lb_regional_subnets :
      (subnet.display_name) => subnet.id
    }
  }
}

output "vcn_ad_subnets" {
  value = { for ad, id in var.oci_availability_domains :
    ad => {
      (oci_core_subnet.vcn_ad_subnets[ad].display_name) : oci_core_subnet.vcn_ad_subnets[ad].id
    }
  }
}
