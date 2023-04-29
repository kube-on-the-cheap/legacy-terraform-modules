variable "do_domain" {
  type        = string
  description = "The domain to create"
}

variable "create_domain" {
  type        = bool
  description = "Shall we create a new domain, or reuse an existing one"
  default     = false
}
