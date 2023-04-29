# oci-tags

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
| [oci_identity_policy.allow_tag_namespace](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/identity_policy) | resource |
| [oci_identity_tag.tags](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/identity_tag) | resource |
| [oci_identity_tag_namespace.tag_namespace](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/identity_tag_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oci_compartment_id"></a> [oci\_compartment\_id](#input\_oci\_compartment\_id) | The Compartment ID under which to provision resources | `string` | n/a | yes |
| <a name="input_oci_iam_dynamic_group_all_instances_k3s"></a> [oci\_iam\_dynamic\_group\_all\_instances\_k3s](#input\_oci\_iam\_dynamic\_group\_all\_instances\_k3s) | The IAM Dynamic Group name hosting all instances in the K3s compartment | `string` | n/a | yes |
| <a name="input_oci_tenancy_id"></a> [oci\_tenancy\_id](#input\_oci\_tenancy\_id) | The Tenancy ID under which to provision resources | `string` | n/a | yes |
| <a name="input_shared_freeform_tags"></a> [shared\_freeform\_tags](#input\_shared\_freeform\_tags) | A map of shared freeform tags | `map(string)` | `{}` | no |
| <a name="input_tag_namespace"></a> [tag\_namespace](#input\_tag\_namespace) | An object describing the Tag Namespace required info | `object({ name : string, description : string })` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of object to identify a tag name and its description and allowed values | <pre>map(object({<br>    description : string,<br>    allowed_values : list(string)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
