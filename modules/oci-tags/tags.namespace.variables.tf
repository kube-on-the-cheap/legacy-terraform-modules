variable "tag_namespace" {
  type        = object({ name : string, description : string })
  description = "An object describing the Tag Namespace required info"
}
