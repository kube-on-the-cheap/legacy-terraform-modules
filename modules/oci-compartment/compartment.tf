resource "oci_identity_compartment" "compartment" {
  compartment_id = var.compartment_first_level ? var.oci_tenancy : var.compartment_parent_id
  description    = var.compartment_description
  name           = var.compartment_name
  defined_tags   = var.compartment_tags.defined
  freeform_tags  = var.compartment_tags.freeform

  lifecycle {
    ignore_changes = [
      defined_tags
    ]
  }

}
