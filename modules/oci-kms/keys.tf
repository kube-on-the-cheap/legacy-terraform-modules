resource "oci_kms_key" "master_encryption_keys" {
  for_each = var.oci_keys

  compartment_id = var.oci_compartment_id
  display_name   = each.key
  key_shape {
    algorithm = contains(["aes", "rsa"], each.value) ? local.key_types[each.value].algorithm : null
    length    = contains(["aes", "rsa"], each.value) ? local.key_types[each.value].length : null
    curve_id  = each.value == "ecdsa" ? local.key_types[each.value].curve_id : null
  }
  management_endpoint = oci_kms_vault.vault.management_endpoint

  freeform_tags = merge(var.shared_freeform_tags, local.kms_freeform_tags)
  # SOFTWARE is free, HSM requires a monthly premium
  protection_mode = "SOFTWARE"

  lifecycle {
    create_before_destroy = true
  }
}

resource "oci_kms_generated_key" "keys" {
  for_each = var.oci_keys

  #Required
  crypto_endpoint       = oci_kms_vault.vault.crypto_endpoint
  include_plaintext_key = true
  key_id                = oci_kms_key.master_encryption_keys[each.key].id
  key_shape {
    algorithm = local.key_types[each.value].algorithm
    length    = local.key_types[each.value].length
  }
}
