resource "oci_identity_user" "bucket_user" {
  count = var.bucket_create_s3_access_key ? 1 : 0

  compartment_id = var.oci_tenancy_id
  description    = "Robot user to access bucket ${oci_objectstorage_bucket.buckets.name} via S3 Compatibility APIs"
  name           = format("s3_user_%s", oci_objectstorage_bucket.buckets.name)

  defined_tags = { "IAM-UserInfo.UserType" = "robot" }
  # PARAM: change this
  email         = "info+${oci_objectstorage_bucket.buckets.name}@domain.co"
  freeform_tags = local.config_freeform_tags
}

resource "oci_identity_policy" "allow_user_bucket_access" {
  count = var.bucket_create_s3_access_key ? 1 : 0

  compartment_id = var.oci_tenancy_id

  name        = "allow_${one(oci_identity_user.bucket_user[*].name)}_write_bucket_${oci_objectstorage_bucket.buckets.name}"
  description = "Policy to allow S3 access for user ${one(oci_identity_user.bucket_user[*].name)} to access bucket ${oci_objectstorage_bucket.buckets.name}"
  statements = [
    "Allow any-user to use buckets in compartment id ${var.oci_compartment_id} where all { target.bucket.name='${oci_objectstorage_bucket.buckets.name}', request.user.id ='${one(oci_identity_user.bucket_user[*].id)}' }",
    "Allow any-user to manage objects in compartment id ${var.oci_compartment_id} where all { target.bucket.name='${oci_objectstorage_bucket.buckets.name}', request.user.id ='${one(oci_identity_user.bucket_user[*].id)}' }"
  ]

  freeform_tags = var.shared_freeform_tags
}
