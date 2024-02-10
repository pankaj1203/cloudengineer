variable "name" {
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

variable "dns_prefix" {
  type = string
  default = null
  }

variable "default_node_pool" {
  type = list(object({
    name = string
    node_count = number
    vm_size = string
}))
default = null
}

variable "identity" {
  type = list(object({
    type = string
  }))
  default = null
  }

