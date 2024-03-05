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
  type = object({
    name = string
    node_count = number
    vm_size = string
    linux_os_config = object({
      swap_file_size_mb = string
      transparent_huge_page_defrag = string
      transparent_huge_page_enabled = string
    })
  })
default = null
}

# variable "linux_os_config" {
#   type = list(object({
#       swap_file_size_mb = string
#       transparent_huge_page_defrag = string
#       transparent_huge_page_enabled = string
#     }))
  
#   default = null
# }


variable "identity" {
  type = list(object({
    type = string
  }))
  default = null
  }

variable "user_node_pool" {
  type = string
  default = null
}

variable "node_pool" {
  type = string
  default = null
}

variable "kubernetes_cluster_id" {
  type = string
  default = null
  }

variable "vm_size" {
  type = string
  default = null
}

variable "node_count" {
  type = number
  default = null
}

variable "tags" {
  type = object({
    environment  = string
  })
  default = null
}

variable "gateway_name" {
  type = string
  default = null
}

variable "subnet_id" {
  type = string
  default = null
}