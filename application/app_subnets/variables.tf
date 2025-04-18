variable "name" {

  description = "name"

}

variable "resource_group_name" {

 description = "resource_group_name"

 type = string

}

variable "vnet_name" {

 description = "vnet_name"

 type = string

}

variable "address_prefixes" {
  
  description = "address_prefixes"

  default     = []

}