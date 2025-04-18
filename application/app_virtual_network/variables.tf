variable "resource_group_name" {
  description = "resource_group_name"

  type = string
}

variable "location" {
  description = "location"
  type = string

}

variable "name" {
  description = "name"
  type = string
}

variable "address_space" {
  description = "address_space"
  default     = []
  type = list(string)
}

variable "tags" {
  description = "tags"
  default     = null
  type = any
}