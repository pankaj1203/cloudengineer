variable "location" {
  type = string
  default = "West Europe"
  
}

variable "virtual_network_name" {
  type = string
  default = null
}

variable "subnet_name" {
  type = string
  default = null
}

variable "address_space" {
  type = list(string)
  default = null
  
}

variable "resource_group_name" {
  type = string
  default = null
}

 variable "address_prefixes" {
    type = list(string)
    default = null
   
 }

 variable "rules" {
 type = object({
    name                     = string
    priority                 = number
    direction                = string
    access                   = string
    protocol                 = string
    source_port_range        = string
    destination_port_range   = string
    source_address_prefix    = string
    destination_address_prefix = string
  })
 default =  null

 }


 

 variable "network_security_group_name" {
  type = string
  default = "nsg1"
   
 }
