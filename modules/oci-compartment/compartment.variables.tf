variable "compartment_first_level" {
  type        = bool
  description = "Is this a first-level compartment? (child of the root one)"
  default     = true
}
variable "compartment_parent_id" {
  type        = string
  description = "In case this is not a first-level compartment, the parent id"
  default     = ""
}
variable "compartment_description" {
  type        = string
  description = "The compartment description"
}
variable "compartment_name" {
  type        = string
  description = "The compartment name"
}
variable "compartment_tags" {
  type = object({
    defined  = map(string),
    freeform = map(string)
  })
  description = "An object describing the tags to apply"
  default = {
    defined  = {}
    freeform = {}
  }
}
