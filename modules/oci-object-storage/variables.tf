variable "oci_compartment_id" {
  type        = string
  description = "The Compartment ID under which to provision resources"
}

variable "oci_tenancy_id" {
  type        = string
  description = "The Tenancy ID under which to provision resources"
}

variable "oci_region" {
  type        = string
  description = "(optional) describe your variable"
}

variable "shared_freeform_tags" {
  type        = map(string)
  description = "A map of shared freeform tags"
  default     = {}
}
