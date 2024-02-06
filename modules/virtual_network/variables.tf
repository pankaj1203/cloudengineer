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

#  variable "security_rule " {
#     type = object({
#       name = string
#       priority = string
#     })
   
#  }