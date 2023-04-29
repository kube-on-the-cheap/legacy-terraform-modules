resource "oci_identity_tag_namespace" "tag_namespace" {
  compartment_id = var.oci_compartment_id
  description    = var.tag_namespace.description
  name           = var.tag_namespace.name
  # freeform_tags = {"Department"= "Finance"}
  is_retired = false
}
