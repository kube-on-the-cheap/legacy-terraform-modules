# oci-compartment

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
| [oci_identity_compartment.compartment](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/identity_compartment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_description"></a> [compartment\_description](#input\_compartment\_description) | The compartment description | `string` | n/a | yes |
| <a name="input_compartment_first_level"></a> [compartment\_first\_level](#input\_compartment\_first\_level) | Is this a first-level compartment? (child of the root one) | `bool` | `true` | no |
| <a name="input_compartment_name"></a> [compartment\_name](#input\_compartment\_name) | The compartment name | `string` | n/a | yes |
| <a name="input_compartment_parent_id"></a> [compartment\_parent\_id](#input\_compartment\_parent\_id) | In case this is not a first-level compartment, the parent id | `string` | `""` | no |
| <a name="input_compartment_tags"></a> [compartment\_tags](#input\_compartment\_tags) | An object describing the tags to apply | <pre>object({<br>    defined  = map(string),<br>    freeform = map(string)<br>  })</pre> | <pre>{<br>  "defined": {},<br>  "freeform": {}<br>}</pre> | no |
| <a name="input_oci_tenancy"></a> [oci\_tenancy](#input\_oci\_tenancy) | The tenant ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The created Compartment ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
