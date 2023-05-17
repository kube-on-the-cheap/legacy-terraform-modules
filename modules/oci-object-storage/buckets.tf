data "oci_objectstorage_namespace" "namespace" {
  compartment_id = var.oci_tenancy_id
}

resource "oci_objectstorage_bucket" "buckets" {
  compartment_id = var.oci_compartment_id
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.namespace.namespace

  access_type   = "NoPublicAccess"
  auto_tiering  = "Disabled"
  freeform_tags = local.config_freeform_tags

  kms_key_id   = var.oci_kms_id
  storage_tier = var.bucket_storage_tier

  metadata              = {}
  object_events_enabled = false

  # dynamic retention_rules {
  #     display_name = var.retention_rule_display_name
  #     duration {
  #         #Required
  #         time_amount = var.retention_rule_duration_time_amount
  #         time_unit = var.retention_rule_duration_time_unit
  #     }
  #     time_rule_locked = var.retention_rule_time_rule_locked
  # }
  versioning = var.bucket_versioning

  depends_on = [
    oci_identity_policy.buckets_policy_allow_kms_access
  ]
}

resource "oci_identity_policy" "buckets_policy_allow_kms_access" {
  compartment_id = var.oci_tenancy_id

  name        = "allow_${var.bucket_name}_key_access"
  description = "Policy to allow bucket \"${var.bucket_name}\" to access KMS key ID used for its encryption"
  statements = [
    "allow service objectstorage-${var.oci_region} to use keys in compartment id ${var.oci_compartment_id} where target.key.id = '${var.oci_kms_id}'"
  ]

  freeform_tags = merge(var.shared_freeform_tags, local.object_storage_freeform_tags)
}
