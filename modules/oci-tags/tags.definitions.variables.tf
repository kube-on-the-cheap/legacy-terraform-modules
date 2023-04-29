variable "tags" {
  type = map(object({
    description : string,
    allowed_values : list(string)
  }))
  description = "A map of object to identify a tag name and its description and allowed values"
}
