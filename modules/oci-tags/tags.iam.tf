resource "oci_identity_policy" "allow_tag_namespace" {
  compartment_id = var.oci_tenancy_id

  name        = "allow_all_instances_tag_namespace_${replace(lower(var.tag_namespace.name), "-", "_")}"
  description = "Policy to allow all instances to use the ${var.tag_namespace.name} Tag Namespace"
  statements = [
    "allow dynamic-group ${var.oci_iam_dynamic_group_all_instances_k3s} to use tag-namespaces in compartment id ${var.oci_compartment_id} where target.tag-namespace.name='${var.tag_namespace.name}'",
    "allow service compute to use tag-namespaces in compartment id ${var.oci_compartment_id} where target.tag-namespace.name='${var.tag_namespace.name}'"
  ]

  freeform_tags = var.shared_freeform_tags
}
