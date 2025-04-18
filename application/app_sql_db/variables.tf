variable "server_name" {

    type = string
    
}

variable "resource_group_name" {

    type = string

}

variable "location" {

    type = string

}

variable "server_version" {

    type = string
}

variable "username" {

    type = string

}

variable "password" {
    type = string
}


variable "sql_database_name" {
    type = string
}

variable "license_type" {

    default = "BasePrice"
}

variable "collation" {

    type = string

    default = "SQL_Latin1_General_CP1_CI_AS"
  
}

variable "storage_account_type" {

    type = string
    default = "Local"
  
}


variable "dbsize" {
    type = string
}

variable "sku_name" {

    default = "Basic"
}

variable "zone_redundant" {

    default = false
    type = bool
  
}

variable "geo_backup_enabled" {

    default = false

    type = bool
  
}