variable "key_vault_name" {

type = string
default = null
  
}

variable "location" {

type = string
default = "West Europe"
  
}


variable "resource_group_name" {

type = string
default = null
  
}

variable "sku_name" {

type = string
default = null
  
}

variable "enabled_for_disk_encryption" {

type = bool
default = null
  
}

variable "tenant_id" {

type = string
default = null
  
}

variable "soft_delete_retention_days" {

type = string
default = null
  
}

variable "access_policy" {
    type = list(object({
      tenant_id = string
      object_id = string
      key_permissions = list(string)
      secret_permissions = list(string)
      storage_permissions = list(string)
    }))
   default = null

}