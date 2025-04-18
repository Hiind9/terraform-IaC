variable "resource_group_name" {}

variable "location" {}

variable "computer_name" {}

variable "vm_name" {}

variable "vm_size" { default = "Standard_B1s" }

variable "username" { default = "azureuser" }

variable "os_disk_caching" { default = "ReadWrite" }

variable "os_disk_storage_account_type" { default = "Standard_LRS" }

variable "source_image_reference_offer" { default = "0001-com-ubuntu-server-jammy" }

variable "source_image_reference_publisher" { default = "Canonical" }

variable "source_image_reference_sku" {default = "22_04-lts" }

variable "source_image_reference_version" { default = "latest" }

variable "public_key" {} 

variable "nic_id" {}
