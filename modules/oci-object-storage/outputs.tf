output "s3_credentials" {
  sensitive   = true
  description = "S3 Compatibility Layer credentials"
  value = { for name, properties in local.for_each_buckets_with_s3_access : name => {
    "ACCESS_KEY" = oci_identity_customer_secret_key.bucket_secret_key[name].id
    "SECRET_KEY" = oci_identity_customer_secret_key.bucket_secret_key[name].key
  } }
}
