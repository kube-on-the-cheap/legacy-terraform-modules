variable "config_oci_location" {
  type        = string
  description = "The default location for your OCI setup file"
  validation {
    condition     = fileexists(var.config_oci_location)
    error_message = "Please pass a valid/accessible setup file path."
  }
  default = "~/.oci/config"
}

variable "config_section_name" {
  type        = string
  description = "The config section name from which extract params"
  default     = "DEFAULT"
}
