# Variables
variable "oci_vault_name" {
  type        = string
  description = "The display name of the single Vault instance to create"
}

# Locals

# Resources
resource "oci_kms_vault" "vault" {
  compartment_id = var.oci_compartment_id

  # VIRTUAL_PRIVATE are a paid type
  vault_type    = "DEFAULT"
  display_name  = var.oci_vault_name
  freeform_tags = var.shared_freeform_tags
}

# Outputs
output "vault" {
  value       = { (var.oci_vault_name) : oci_kms_vault.vault.id }
  description = "The name and ID of the generated Vault"
}
