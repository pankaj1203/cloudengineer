resource "iot_hub" "iot_hub" {  
  name                         = var.iot_hub_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  local_authentication_enabled = var.local_authentication_enabled
        }
        dynamic "sku" {  
            for_each = var.iot_hub.sku != null ? [1] : []
            content {
                name = var.iot_hub.sku.name
                capacity = var.iot_hub.sku.capacity
            }
        }
        dynamic "endpoint" {
            for_each = var.endpoint != null ? [1] : []
            content {
                type = var.endpoint.type
                connection_string = var.endpoint.connection_string
                name = var.endpoint.name
                 batch_frequency_in_seconds = var.endpoint.batch_frequency_in_seconds
                 max_chunk_size_in_bytes = var.endpoint.max_chunk_size_in_bytes
                 container_name = var.endpoint.container_name
                 encoding = var.endpoint.encoding
                 file_name_format = var.endpoint.file_name_format
            }
        }
        dynamic "route" {
            for_each = var.route != null ? [1] : []
            content {
                name = var.route.name
                source = var.route.source
                condition = var.route.condition
                endpoint_names = var.route.endpoint_names
                enabled = var.route
            }
        }
        dynamic "enrichment" {
            for_each = var.enrichment != null ? [1] : []
            content {
                key = var.enrichment.key
                value = var.enrichment.value
                endpoint_names = var.enrichment.endpoint_names
            }
        }
        dynamic "cloud_to_device" {
            for_each = var.cloud_to_device != null ? [1] : []
            content {
                max_delivery_count = var.cloud_to_device.max_delivery_count
                default_ttl = var.cloud_to_device.default_ttl
                }
                dynamic "feedback" {
                    for_each = var.cloud_to_device.feedback != null ? [1] : []
                    content {
                        time_to_live = var.cloud_to_device.feedback.time_to_live
                        max_delivery_count = var.cloud_to_device.feedback.max_delivery_count
                        lock_duration = var.cloud_to_device.feedback.lock_duration
                    }
                }
        }
        dynamic "tags" {
            for_each = var.iot_hub.tags != null ? [1] : []
            content {
                purpose = var.iot_hub.tags.purpose
            }
        }
        

