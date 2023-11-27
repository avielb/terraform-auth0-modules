variable "client_id" {
  type = string
  description = "The ID of the client to which the grant will be assigned."
}

variable "audience" {
  type = string
  description = "The API audience to which the grant will be assigned."
}

variable "scopes" {
  type = list(string)
  description = "The scopes to be granted to the client."
}
