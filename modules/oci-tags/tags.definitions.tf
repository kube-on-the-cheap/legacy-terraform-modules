resource "oci_identity_tag" "tags" {
  for_each = var.tags

  tag_namespace_id = oci_identity_tag_namespace.tag_namespace.id
  name             = each.key
  description      = each.value.description

  is_cost_tracking = false
  # If we have allowed_values, set a dynamic validator. Otherwise it takes any parameter, including empty string.
  dynamic "validator" {
    for_each = { for k, v in each.value : k => v if k == "allowed_values" && length(v) > 0 }

    content {
      validator_type = "ENUM"
      values         = validator.value
    }
  }
  is_retired = false
}
