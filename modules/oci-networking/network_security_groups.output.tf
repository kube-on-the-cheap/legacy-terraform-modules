output "network_security_groups" {
  value = {
    permit_ssh       = oci_core_network_security_group.permit_ssh.id
    permit_apiserver = oci_core_network_security_group.permit_apiserver.id
    permit_web       = oci_core_network_security_group.permit_web.id
  }
}
