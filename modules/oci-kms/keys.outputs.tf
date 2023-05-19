output "generated_keys" {
  value       = { for name, value in var.oci_keys : name => oci_kms_generated_key.keys[name].id }
  description = "The name and ID for each requested Key"
}

output "master_encryption_keys" {
  value       = { for name, value in var.oci_keys : name => oci_kms_key.master_encryption_keys[name].id }
  description = "The name and ID for each requested Master Encryption Key"
}
