# oci-object-storage

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
| [oci_identity_customer_secret_key.bucket_secret_key](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/identity_customer_secret_key) | resource |
| [oci_identity_policy.allow_user_bucket_access](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/identity_policy) | resource |
| [oci_identity_policy.buckets_policy_allow_kms_access](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/identity_policy) | resource |
| [oci_identity_user.bucket_user](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/identity_user) | resource |
| [oci_objectstorage_bucket.buckets](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/resources/objectstorage_bucket) | resource |
| [oci_objectstorage_namespace.namespace](https://registry.terraform.io/providers/oracle/oci/4.87.0/docs/data-sources/objectstorage_namespace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_create_s3_access_key"></a> [bucket\_create\_s3\_access\_key](#input\_bucket\_create\_s3\_access\_key) | (optional) describe your variable | `bool` | `false` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket to create | `string` | n/a | yes |
| <a name="input_bucket_storage_tier"></a> [bucket\_storage\_tier](#input\_bucket\_storage\_tier) | Bucket storage tier | `string` | n/a | yes |
| <a name="input_bucket_versioning"></a> [bucket\_versioning](#input\_bucket\_versioning) | Bucket versioning status | `string` | n/a | yes |
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
