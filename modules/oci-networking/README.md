# oci-networking

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 4.87.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.87.0 |

## Resources

| Name | Type |
|------|------|
| [oci_core_default_route_table.internet_route_table](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_default_route_table) | resource |
| [oci_core_default_security_list.default_regional_list](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_default_security_list) | resource |
| [oci_core_internet_gateway.internet_gateway](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_internet_gateway) | resource |
| [oci_core_network_security_group.permit_apiserver](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_network_security_group) | resource |
| [oci_core_network_security_group.permit_ssh](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_network_security_group) | resource |
| [oci_core_network_security_group.permit_web](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_network_security_group) | resource |
| [oci_core_network_security_group_security_rule.permit_apiserver](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.permit_http](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.permit_http_alt](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.permit_https](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.permit_https_alt](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.permit_ssh](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_subnet.vcn_ad_subnets](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_subnet) | resource |
| [oci_core_subnet.vcn_regional_subnet](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_subnet) | resource |
| [oci_core_vcn.vcn](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/core_vcn) | resource |
| [oci_identity_compartment.compartment](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/data-sources/identity_compartment) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oci_availability_domains"></a> [oci\_availability\_domains](#input\_oci\_availability\_domains) | A map of name and IDs for every AD in the referenced compartment | `map(string)` | n/a | yes |
| <a name="input_oci_compartment_id"></a> [oci\_compartment\_id](#input\_oci\_compartment\_id) | The Compartment ID under which to provision resources | `string` | n/a | yes |
| <a name="input_oci_networks_vcn_cidr"></a> [oci\_networks\_vcn\_cidr](#input\_oci\_networks\_vcn\_cidr) | A valid CIDR to use with the VCN | `string` | n/a | yes |
| <a name="input_oci_networks_vcn_display_name"></a> [oci\_networks\_vcn\_display\_name](#input\_oci\_networks\_vcn\_display\_name) | The VCN display name | `string` | n/a | yes |
| <a name="input_oci_networks_vcn_dns_label"></a> [oci\_networks\_vcn\_dns\_label](#input\_oci\_networks\_vcn\_dns\_label) | The DNS label for this VCN | `string` | n/a | yes |
| <a name="input_oci_region"></a> [oci\_region](#input\_oci\_region) | The OCI Region | `string` | n/a | yes |
| <a name="input_public_zone_name"></a> [public\_zone\_name](#input\_public\_zone\_name) | The FQDN of the zone used to access resources | `string` | n/a | yes |
| <a name="input_shared_freeform_tags"></a> [shared\_freeform\_tags](#input\_shared\_freeform\_tags) | A map of shared freeform tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_security_groups"></a> [network\_security\_groups](#output\_network\_security\_groups) | n/a |
| <a name="output_vcn_ad_subnets"></a> [vcn\_ad\_subnets](#output\_vcn\_ad\_subnets) | n/a |
| <a name="output_vcn_regional_subnet"></a> [vcn\_regional\_subnet](#output\_vcn\_regional\_subnet) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
