# variable "oci_bucket" {
#   type = object({
#     # Standard, Archive
#     storage_tier : string
#     # Disabled, Enabled, Suspended
#     versioning : string
#     read_only : bool
#     group_allow_access : optional(string),
#     retention : optional(string),
#     create_s3_access_key : optional(bool, false)
#   })
#   description = "The description of a bucket to create"
#   # https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/managingbuckets.htm#bucketnames
#   validation {
#     condition     = length([for bucket_name in keys(var.oci_buckets) : bucket_name if length(bucket_name) >= 1 && length(bucket_name) <= 256]) > 0
#     error_message = "Please enter at least a bucket name, within the Oracle Cloud naming convention."
#   }
# }

variable "bucket_name" {
  type        = string
  description = "The name of the bucket to create"
  validation {
    condition     = length(var.bucket_name) >= 4 && length(var.bucket_name) <= 256
    error_message = "Incorrect bucket name length."
  }
}

variable "bucket_storage_tier" {
  type        = string
  description = "Bucket storage tier"
  validation {
    condition     = contains(["Standard", "Archive"], var.bucket_storage_tier)
    error_message = "Storage tier must be either \"Standard\" or \"Archive\". "
  }
}

variable "bucket_versioning" {
  type        = string
  description = "Bucket versioning status"
  validation {
    condition     = contains(["Disabled", "Enabled", "Suspended"], var.bucket_versioning)
    error_message = "Storage tier must be either \"Disabled\", \"Enabled\", \"Suspended\". "
  }
}

variable "bucket_create_s3_access_key" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "oci_kms_id" {
  type        = string
  description = "The OCI KMS master encryption key id to use."
}
