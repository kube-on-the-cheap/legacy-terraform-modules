# Resources
resource "oci_identity_customer_secret_key" "bucket_secret_key" {
  count = var.bucket_create_s3_access_key ? 1 : 0

  display_name = format("Access Key for S3 compatibility access for bucket %s", var.bucket_name)
  user_id      = one(oci_identity_user.bucket_user[*].id)
}

# Outputs
output "s3_credentials" {
  sensitive   = true
  description = "S3 Compatibility Layer credentials"
  value = var.bucket_create_s3_access_key ? {
    "ACCESS_KEY" = one(oci_identity_customer_secret_key.bucket_secret_key[*].id)
    "SECRET_KEY" = one(oci_identity_customer_secret_key.bucket_secret_key[*].key)
  } : null
}
