variable "public_ip_address_name" {

    type = string
  
}

variable "location" {

     type = string
  
}

variable "resource_group_name" {

    type = string
  
}

variable "ip_allocation_method" {

    type = string
  
}

variable "tags" {

    default = {}
  
}

variable "sku" {
    
    type = string
}