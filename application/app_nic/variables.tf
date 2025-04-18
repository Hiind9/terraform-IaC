variable "nic_name" {

    type = string
  
}

variable "location" {

    type = string
  
}

variable "ip_configuration_name" {

    type = string
  
}


variable "private_ip_address_allocation" {

    type = string

    default = "Dynamic"
  
}


variable "subnet_id" {

    type = string
  
}

variable "tags" {

    type = any

    default = {}
  
}

variable "resource_group_name" {

    type = string
  
}

variable "public_ip_address_id" {

    type = string
  
}
variable "network_security_group_id" {

    type = string
  
}