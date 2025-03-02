# Legacy Terraform Modules

> :warning: Archiving notice!
>
> This repo isn't maintained anymore. It was part of the v1 solution based on Terraform, cloud-init and Ansible to provision K3s. 

This repo contains a few Terraform modules; the prefix describes the Cloud Provider they refer to (`do` for `DigitalOcean`, `oci` for `Oracle Cloud Infrastructure`).

They are:
* [`do-domain`](./modules/do-domain/) to create and maintain DNS zones
* [`oci-tags`](./modules/oci-tags/) creates a Tag namespace with some pre-defined values that are used in Ansible to flag the cluster join progress
* [`oci-k3s-masters`](./modules/oci-k3s-masters) and [`oci-k3s-workers`](./modules/oci-k3s-workers/) to configure autoscaling groups for K3s master and worker nodes
* [`oci-kms`](./modules/oci-kms/) creates all Vault-related secrets and permissions
* [`oci-networking`](./modules/oci-networking/) builds the VCN and perform the subnetting logic
* [`oci-object-storage`](./modules/oci-object-storage/) creates buckets, permissions pertaining the Object Storage requirements for K3s