variable "nsg_name" {

    type = string
  
}

variable "resource_group_name" {
    type = string
  
}

variable "location" {
    type = string
  
}

variable "tags" {
    type = any

    default = {}
  
}
