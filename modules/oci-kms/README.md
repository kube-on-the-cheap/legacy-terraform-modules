# oci-kms

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
| [oci_kms_generated_key.keys](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/kms_generated_key) | resource |
| [oci_kms_key.master_encryption_keys](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/kms_key) | resource |
| [oci_kms_vault.vault](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/kms_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oci_compartment_id"></a> [oci\_compartment\_id](#input\_oci\_compartment\_id) | The Compartment ID under which to provision resources | `string` | n/a | yes |
| <a name="input_oci_keys"></a> [oci\_keys](#input\_oci\_keys) | A map of key names and their types to create | `map(string)` | n/a | yes |
| <a name="input_oci_vault_name"></a> [oci\_vault\_name](#input\_oci\_vault\_name) | The display name of the single Vault instance to create | `string` | n/a | yes |
| <a name="input_shared_freeform_tags"></a> [shared\_freeform\_tags](#input\_shared\_freeform\_tags) | A map of shared freeform tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_generated_keys_ids"></a> [generated\_keys\_ids](#output\_generated\_keys\_ids) | The ID for each requested Key |
| <a name="output_master_encryption_keys_ids"></a> [master\_encryption\_keys\_ids](#output\_master\_encryption\_keys\_ids) | The ID for each requested Master Encryption Key |
| <a name="output_vault_id"></a> [vault\_id](#output\_vault\_id) | The Vault ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
