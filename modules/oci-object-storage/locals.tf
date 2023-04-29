locals {
  object_storage_freeform_tags = {
    "CreatedWith"     = "Terraform"
    "ResourcesFamily" = "K3s"
  }
  config_freeform_tags = merge(var.shared_freeform_tags, local.object_storage_freeform_tags)

  for_each_buckets_with_s3_access = { for name, properties in var.oci_buckets : name => properties if properties.create_s3_access_key }
}
