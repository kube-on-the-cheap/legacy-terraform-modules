variable "oci_compartment_id" {
  type        = string
  description = "The Compartment ID under which to provision resources"
}

variable "oci_region" {
  type        = string
  description = "The OCI Region"
}

variable "shared_freeform_tags" {
  type        = map(string)
  description = "A map of shared freeform tags"
  default     = {}
}

variable "oci_availability_domains" {
  type        = map(string)
  description = "A map of name and IDs for every AD in the referenced compartment"
}
