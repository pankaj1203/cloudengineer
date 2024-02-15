
variable "azurerm_resource_group" {
    type = string
    default = "assessment1"
}

variable "iot_hub_name" {
    type = string
    default = "assessment1"
}

variable "local_authentication_enabled" {
    type = string
    default = null
}

variable "sku" {
    type = object({
            name = string
            capacity = number
        })
}

      variable "endpoint" {
        type = object({
            type = string
            connection_string = string
            name = string
            batch_frequency_in_seconds = number
            max_chunk_size_in_bytes = number
            container_name = string
            encoding = string
            file_name_format = string
        })


       variable "route" { 
        type = object({
            name = string
            source = string
            condition = string
            endpoint_names = list(string)
            enabled = bool
        })
       }


       variable "enrichment" {
       type = object({
            key = string
            value = string
            endpoint_names = list(string)
        })
      }
        variable "cloud_to_device" 
        type = object({
            max_delivery_count = number
            default_ttl = string
            feedback = object({
                time_to_live = string
                max_delivery_count = number
                lock_duration = string
            })
        })
        tags = object({
            purpose = string
        })
    }
    
