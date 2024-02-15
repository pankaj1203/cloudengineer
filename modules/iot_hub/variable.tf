variable "iot_hub_name" {
  type = string
  default = null
}

variable "resource_group_name" {
    type = string
    default = null
}

variable "location" {
    type = string
    default = null
}

variable "local_authentication_enabled" {
    type = bool
    default = null
}

variable "sku" {
  type = list(object({
    name     = string
    capacity = string
  }))
  default = null
  }

variable "endpoint" {
    type = list(object({
    type                       = string
    connection_string          = string
    name                       = string
    batch_frequency_in_seconds = number
    max_chunk_size_in_bytes    = number
    container_name             = string
    encoding                   = string
    file_name_format           = any
    }))
   default = null
}

variable "route" {
  type = list(object({
    name           = string
    source         = string
    condition      = string
    endpoint_names = list(string)
    enabled        = bool
  }))
 default = null
}


variable "enrichment" {
  type = list(object({
    key            = string
    value          = string
    endpoint_names = list(string)
  }))
  default = null
  }


variable "cloud_to_device" {
  type = object({
    max_delivery_count = number
    default_ttl = string
    feedback = object({
      time_to_live = string
      max_delivery_count = number
      lock_duration = string
    })
  })
 default = null
}
