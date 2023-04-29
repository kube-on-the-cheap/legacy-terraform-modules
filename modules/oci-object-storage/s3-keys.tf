resource "oci_identity_customer_secret_key" "bucket_secret_key" {
  for_each = { for name, properties in var.oci_buckets : name => properties if properties.create_s3_access_key }

  display_name = format("Access Key for S3 compatibility access for bucket %s", each.key)
  user_id      = oci_identity_user.bucket_user[each.key].id
}
