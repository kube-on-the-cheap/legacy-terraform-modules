variable "oci_networks_vcn_cidr" {
  type        = string
  description = "A valid CIDR to use with the VCN"
  validation {
    condition     = try(length(cidrhost(var.oci_networks_vcn_cidr, 0)) > 0, false) && try(length(cidrnetmask(var.oci_networks_vcn_cidr)) > 0, false)
    error_message = "You need to specify a valid CIDR."
  }
}

variable "oci_networks_vcn_display_name" {
  type        = string
  description = "The VCN display name"
  validation {
    condition     = length(var.oci_networks_vcn_display_name) > 3 && length(var.oci_networks_vcn_display_name) < 32
    error_message = "The VCN display name must be between 3 and 32 characters."
  }
}

variable "oci_networks_vcn_dns_label" {
  type        = string
  description = "The DNS label for this VCN"
}
