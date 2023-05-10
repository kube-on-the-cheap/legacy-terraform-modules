output "common" {
  description = "The OCI configuration parameters, without sensitive data"
  value = {
    for k, v in jsondecode(data.config_ini.config_oci.json) : trimspace(k) => trimspace(v) if !contains(["pass_phrase", "key_file"], trimspace(k))
  }
}

output "sensitive" {
  sensitive   = true
  description = "The OCI configuration parameters, without sensitive data"
  value = {
    for k, v in jsondecode(data.config_ini.config_oci.json) : trimspace(k) => trimspace(v) if contains(["pass_phrase", "key_file"], trimspace(k))
  }
}
