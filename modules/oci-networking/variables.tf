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

variable "public_zone_name" {
  type        = string
  description = "The FQDN of the zone used to access resources"
}

variable "oci_availability_domains" {
  type        = map(string)
  description = "A map of name and IDs for every AD in the referenced compartment"
}
