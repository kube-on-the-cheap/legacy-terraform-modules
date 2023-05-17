locals {
  object_storage_freeform_tags = {
    "CreatedWith"     = "Terraform"
    "ResourcesFamily" = "K3s"
  }
  config_freeform_tags = merge(var.shared_freeform_tags, local.object_storage_freeform_tags)

}
