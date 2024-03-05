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

 variable "security_rule" {
 type = list(object({
    name                     = string
    priority                 = number
    direction                = string
    access                   = string
    protocol                 = string
    source_port_range        = string
    destination_port_range   = string
    source_address_prefix    = string
    destination_address_prefix = string
  }))
 default =  [
   {
       name                     = "allow-ssh",
       priority                 = 100,
       direction                = "Inbound",
       access                   = "Allow",
       protocol                 = "Tcp",
       source_port_range        = "*",
       destination_port_range   = "22",
       source_address_prefix    = "*",
       destination_address_prefix = "VirtualNetwork"
   },
   {
       name                     = "allow-ftp",
       priority                 = 101,
       direction                = "Inbound",
       access                   = "Allow",
       protocol                 = "Tcp",
       source_port_range        = "*",
       destination_port_range   = "22",
       source_address_prefix    = "*",
       destination_address_prefix = "VirtualNetwork"
   },
   {
      name                     = "allow-80",
       priority                 = 103,
       direction                = "Inbound",
       access                   = "Allow",
       protocol                 = "Tcp",
       source_port_range        = "*",
       destination_port_range   = "80",
       source_address_prefix    = "*",
       destination_address_prefix = "VirtualNetwork"
   }
  ]

 }


 

 variable "network_security_group_name" {
  type = string
  default = "nsg1"
   
 }

variable "agic_name" {
  type = string
  default = null
}

variable "sku" {
  type = string
  default = null
}

variable "access_endpoint_type" {
  type = string
  default = null
}

variable "virtual_network_subnet_ids" {
 type = list(string)
 default = null
}