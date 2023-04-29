data "config_ini" "config_oci" {
  ini     = file(var.config_oci_location)
  section = var.config_section_name
}
