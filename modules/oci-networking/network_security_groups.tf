resource "oci_core_network_security_group" "permit_ssh" {
  compartment_id = var.oci_compartment_id

  vcn_id       = oci_core_vcn.vcn.id
  display_name = "Permit SSH"
}

resource "oci_core_network_security_group_security_rule" "permit_ssh" {
  network_security_group_id = oci_core_network_security_group.permit_ssh.id

  protocol    = "6" // TCP
  source      = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 22
      min = 22
    }
  }
  direction = "INGRESS"
}

# ---

resource "oci_core_network_security_group" "permit_apiserver" {
  compartment_id = var.oci_compartment_id

  vcn_id       = oci_core_vcn.vcn.id
  display_name = "Allow K3s control plane acceess"
}

resource "oci_core_network_security_group_security_rule" "permit_apiserver" {
  network_security_group_id = oci_core_network_security_group.permit_apiserver.id

  protocol    = "6" // TCP
  source      = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 6443
      min = 6443
    }
  }
  direction = "INGRESS"
}

# ---

resource "oci_core_network_security_group" "permit_web" {
  compartment_id = var.oci_compartment_id

  vcn_id       = oci_core_vcn.vcn.id
  display_name = "Allow HTTP/HTTPS traffic"
}

resource "oci_core_network_security_group_security_rule" "permit_http" {
  network_security_group_id = oci_core_network_security_group.permit_web.id

  protocol    = "6" // TCP
  source      = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
  direction = "INGRESS"
}

resource "oci_core_network_security_group_security_rule" "permit_http_alt" {
  network_security_group_id = oci_core_network_security_group.permit_web.id

  protocol    = "6" // TCP
  source      = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 8080
      min = 8080
    }
  }
  direction = "INGRESS"
}

resource "oci_core_network_security_group_security_rule" "permit_https" {
  network_security_group_id = oci_core_network_security_group.permit_web.id

  protocol    = "6" // TCP
  source      = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 443
      min = 443
    }
  }
  direction = "INGRESS"
}

resource "oci_core_network_security_group_security_rule" "permit_https_alt" {
  network_security_group_id = oci_core_network_security_group.permit_web.id

  protocol    = "6" // TCP
  source      = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 8443
      min = 8443
    }
  }
  direction = "INGRESS"
}
