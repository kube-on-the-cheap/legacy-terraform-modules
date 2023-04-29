resource "oci_kms_vault" "vault" {
  compartment_id = var.oci_compartment_id

  # VIRTUAL_PRIVATE are a paid type
  vault_type    = "DEFAULT"
  display_name  = var.oci_vault_name
  freeform_tags = merge(var.shared_freeform_tags, local.kms_freeform_tags)
}
