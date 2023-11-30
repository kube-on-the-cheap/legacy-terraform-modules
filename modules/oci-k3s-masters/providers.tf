# Variables

variable "oci_compartment_id" {
  type        = string
  description = "The Compartment ID under which to provision resources"
}

variable "oci_tenancy_id" {
  type        = string
  description = "The Compartment ID under which to provision resources"
}

variable "oci_vcn_subnet_id" {
  type        = string
  description = "The VCN subnet to provision Compute resources in"
}

# Terraform

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
<<<<<<< HEAD
      version = "5.22.0"
=======
      version = "4.87.0"
>>>>>>> e30cd55 (chore: split compute in master and workers, fix masters)
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.1"
    }
<<<<<<< HEAD
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.3"
=======
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
>>>>>>> e30cd55 (chore: split compute in master and workers, fix masters)
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = "~> 1.4.0"
}
