output "generated_keys_ids" {
  value       = { for name, value in var.oci_keys : name => oci_kms_generated_key.keys[name].id }
  description = "The ID for each requested Key"
}

output "master_encryption_keys_ids" {
  value       = { for name, value in var.oci_keys : name => oci_kms_key.master_encryption_keys[name].id }
  description = "The ID for each requested Master Encryption Key"
}

output "vault_id" {
  value       = oci_kms_vault.vault.id
  description = "The Vault ID"
}
