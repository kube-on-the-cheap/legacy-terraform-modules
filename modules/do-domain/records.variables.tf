variable "a_record_list" {
  type = list(object({
    name : string,
    value : string,
    ttl : optional(number)
  }))
  description = "A list of A records to create."
  default     = []
}

variable "cname_record_list" {
  type = list(object({
    name : string,
    value : string,
    ttl : optional(number)
  }))
  description = "A list of CNAME records to create."
  default     = []
}

variable "ns_record_list" {
  type = list(object({
    name : string,
    value : string,
    ttl : optional(number)
  }))
  description = "A list of NS records to create."
  default     = []
}
