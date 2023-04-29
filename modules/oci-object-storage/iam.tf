resource "oci_identity_user" "bucket_user" {
  for_each = local.for_each_buckets_with_s3_access

  compartment_id = var.oci_tenancy_id
  description    = "Robot user to access bucket ${oci_objectstorage_bucket.buckets[each.key].name} via S3 Compatibility APIs"
  name           = format("s3_user_%s", oci_objectstorage_bucket.buckets[each.key].name)

  defined_tags = { "IAM-UserInfo.UserType" = "robot" }
  # PARAM: change this
  email         = "info+${oci_objectstorage_bucket.buckets[each.key].name}@domain.co"
  freeform_tags = local.config_freeform_tags
}

resource "oci_identity_policy" "allow_user_bucket_access" {
  for_each = local.for_each_buckets_with_s3_access

  compartment_id = var.oci_tenancy_id

  name        = "allow_${oci_identity_user.bucket_user[each.key].name}_write_bucket_${oci_objectstorage_bucket.buckets[each.key].name}"
  description = "Policy to allow S3 access for user ${oci_identity_user.bucket_user[each.key].name} to access bucket ${oci_objectstorage_bucket.buckets[each.key].name}"
  statements = [
    "Allow any-user to use buckets in compartment id ${var.oci_compartment_id} where all { target.bucket.name='${oci_objectstorage_bucket.buckets[each.key].name}', request.user.id ='${oci_identity_user.bucket_user[each.key].id}' }",
    "Allow any-user to manage objects in compartment id ${var.oci_compartment_id} where all { target.bucket.name='${oci_objectstorage_bucket.buckets[each.key].name}', request.user.id ='${oci_identity_user.bucket_user[each.key].id}' }"
  ]

  freeform_tags = var.shared_freeform_tags
}
