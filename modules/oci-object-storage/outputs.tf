output "s3_credentials" {
  sensitive   = true
  description = "S3 Compatibility Layer credentials"
  value = var.bucket_create_s3_access_key ? {
    (var.bucket_name) : {
      "ACCESS_KEY" = one(oci_identity_customer_secret_key.bucket_secret_key[*].id)
      "SECRET_KEY" = one(oci_identity_customer_secret_key.bucket_secret_key[*].key)
    }
  } : null
}
