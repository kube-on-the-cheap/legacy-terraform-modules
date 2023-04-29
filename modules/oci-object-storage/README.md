# oci-object-storage

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.115.0 |

## Resources

| Name | Type |
|------|------|
| [oci_identity_customer_secret_key.bucket_secret_key](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_customer_secret_key) | resource |
| [oci_identity_policy.allow_user_bucket_access](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_policy) | resource |
| [oci_identity_policy.buckets_policy_allow_kms_access](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_policy) | resource |
| [oci_identity_user.bucket_user](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_user) | resource |
| [oci_objectstorage_bucket.buckets](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_bucket) | resource |
| [oci_objectstorage_namespace.namespace](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/objectstorage_namespace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oci_buckets"></a> [oci\_buckets](#input\_oci\_buckets) | The description of buckets to create | <pre>map(object({<br>    # Standard, Archive<br>    storage_tier : string<br>    # Disabled, Enabled, Suspended<br>    versioning : string<br>    read_only : bool<br>    group_allow_access : optional(string),<br>    retention : optional(string),<br>    create_s3_access_key : optional(bool, false)<br>  }))</pre> | n/a | yes |
| <a name="input_oci_compartment_id"></a> [oci\_compartment\_id](#input\_oci\_compartment\_id) | The Compartment ID under which to provision resources | `string` | n/a | yes |
| <a name="input_oci_kms_id"></a> [oci\_kms\_id](#input\_oci\_kms\_id) | The OCI KMS master encryption key id to use. | `string` | n/a | yes |
| <a name="input_oci_region"></a> [oci\_region](#input\_oci\_region) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_oci_tenancy_id"></a> [oci\_tenancy\_id](#input\_oci\_tenancy\_id) | The Tenancy ID under which to provision resources | `string` | n/a | yes |
| <a name="input_shared_freeform_tags"></a> [shared\_freeform\_tags](#input\_shared\_freeform\_tags) | A map of shared freeform tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_credentials"></a> [s3\_credentials](#output\_s3\_credentials) | S3 Compatibility Layer credentials |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
