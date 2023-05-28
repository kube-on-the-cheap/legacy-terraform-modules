# Variables
variable "iam_secrets_ct_role" {
  type        = string
  description = "Create cross-teanancy as source or destination"
  validation {
    condition     = contains(["source", "destination", "no_cross_tenancy"], var.iam_secrets_ct_role)
    error_message = "Please enter one of 'source' or 'destination'."
  }
  default = "no_cross_tenancy"
}

variable "oci_iam_noderole_groups" {
  type = object({
    local  = string
    remote = optional(string)
  })
  description = "The ID of the local and optionally remote K3s.NodeRole dynamic IAM groups"
}

variable "oci_iam_ct_remote_tenenacy" {
  type        = string
  description = "The remote tenancy OCID"
  default     = ""
}

# Resources
resource "oci_identity_policy" "k3s_allow_nodes_update_self" {
  compartment_id = var.oci_tenancy_id

  name        = "allow_k3s_${local.node_role}s_update_self"
  description = "Policy to allow each instance of a K3s node to update only itself"
  statements = [
    "allow dynamic-group id ${var.oci_iam_noderole_groups.local} to use instance in compartment id ${var.oci_compartment_id} where request.instance.id=target.instance.id"
  ]

  freeform_tags = var.shared_freeform_tags
}

# resource "oci_identity_policy" "k3s_allow_nodes_read_lb" {
#   compartment_id = var.oci_tenancy_id
#   name        = "allow_k3s_${local.node_role}s_read_lb"
#   description = "Policy to allow K3s master nodes to read lb resources"
#   statements = [
#     "allow dynamic-group id ${var.oci_iam_noderole_groups.local} to read load-balancer in compartment id ${var.oci_compartment_id}"
#   ]

#   freeform_tags = var.shared_freeform_tags
# }

resource "oci_identity_policy" "k3s_allow_nodes_read_secrets" {
  for_each = { for name, value in var.k3s_tags : name => value if startswith(name, "K3s-ClusterSecrets") }

  compartment_id = var.oci_tenancy_id

  name        = "allow_k3s_${local.node_role}s_read_secret_${replace(split(".", each.key)[1], "-", "_")}"
  description = "Policy to allow K3s nodes to read secret ${split(".", each.key)[1]}"
  statements = [
    "allow dynamic-group id ${var.oci_iam_noderole_groups.local} to inspect vaults in compartment id ${var.oci_compartment_id}",
    "allow dynamic-group id ${var.oci_iam_noderole_groups.local} to use secret-family in compartment id ${var.oci_compartment_id} where target.secret.id='${each.value}'"
  ]

  freeform_tags = var.shared_freeform_tags
}

resource "oci_identity_policy" "k3s_cross_tenancy_read_secrets_source" {
  for_each = { for name, value in var.k3s_tags : name => value if startswith(name, "K3s-ClusterSecrets") && var.iam_secrets_ct_role == "source" }

  compartment_id = var.oci_tenancy_id

  name        = "allow_ct_k3s_${local.node_role}s_read_secret_${replace(split(".", each.key)[1], "-", "_")}"
  description = "Policy to allow cross-tenant K3s nodes to read secret ${split(".", each.key)[1]}"
  statements = [
    "Define tenancy RemoteTenancy as ${var.oci_iam_ct_remote_tenenacy}",
    "Define group RemoteMasters ${var.oci_iam_noderole_groups.remote}",
    "Admit group RemoteMasters of tenancy RemoteTenancy to inspect vaults in compartment id ${var.oci_compartment_id}",
    "Admit group RemoteMasters of tenancy RemoteTenancy to use secret-family in compartment id ${var.oci_compartment_id} where target.secret.id='${each.value}'"
  ]

  freeform_tags = var.shared_freeform_tags
}

resource "oci_identity_policy" "k3s_cross_tenancy_read_secrets_destination" {
  for_each = { for name, value in var.k3s_tags : name => value if startswith(name, "K3s-ClusterSecrets") && var.iam_secrets_ct_role == "destination" }

  compartment_id = var.oci_tenancy_id

  name        = "allow_ct_k3s_${local.node_role}s_read_secret_${replace(split(".", each.key)[1], "-", "_")}"
  description = "Policy to allow cross-tenant K3s nodes to read secret ${split(".", each.key)[1]}"
  statements = [
    "Define tenancy RemoteTenancy as ${var.oci_iam_ct_remote_tenenacy}",
    "Define group LocalMasters ${var.oci_iam_noderole_groups.local}",
    "Endorse group LocalMasters of tenancy RemoteTenancy to inspect vaults in compartment id ${var.oci_compartment_id}",
    "Endorse group LocalMasters of tenancy RemoteTenancy to use secret-family in compartment id ${var.oci_compartment_id} where target.secret.id='${each.value}'"
  ]

  freeform_tags = var.shared_freeform_tags
}

# allow dynamic-group [your dynamic group name] to read instance-family in compartment [your compartment name]
# allow dynamic-group [your dynamic group name] to use virtual-network-family in compartment [your compartment name]
# allow dynamic-group [your dynamic group name] to manage load-balancers in compartment [your compartment name]

resource "oci_identity_policy" "k3s_allow_nodes_ccm" {
  for_each = {
    "instance-family" : "read",
    "virtual-network-family" : "use",
    "load-balancers" : "manage"
  }

  compartment_id = var.oci_tenancy_id

  name        = "allow_k3s_${local.node_role}s_${each.value}_${replace(each.key, "-", "_")}"
  description = "Policy to allow K3s master nodes to ${each.value} ${each.key}"
  statements = [
    "allow dynamic-group id ${var.oci_iam_noderole_groups.local} to ${each.value} ${each.key} in compartment id ${var.oci_compartment_id}"
  ]

  freeform_tags = merge(var.shared_freeform_tags)
}


# # Source
# Define tenancy vendorX as ocid1.tenancy.oc1…..qpfd <vendorX unique OCID>
# Define group OpsTeam ocid1.group.oc1…..fjiq <OpsTeam unique OCID>
# Admit group OpsTeam of tenancy vendorX to read instance-family in tenancy

# # Destination
# Define tenancy companyABC as ocid1.tenancy.oc1…vnxw <companyABC unique OCID>
# Endorse group OpsTeam to read instance-family in tenancy companyABC
