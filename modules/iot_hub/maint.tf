resource "azurerm_iothub" "iot_hub_name" {
  name                         = var.iot_hub_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  #local_authentication_enabled = var.local_authentication_enabled


dynamic "sku" {
  for_each = var.sku
  content {
    name = sku.value.name
    capacity = sku.value.capacity
  }
} 


dynamic "endpoint" {
for_each = var.endpoint
content {
    type                       = endpoint.value.type
    connection_string          = endpoint.value.connection_string
    name                       = endpoint.value.name
    batch_frequency_in_seconds = endpoint.value.batch_frequency_in_seconds
    max_chunk_size_in_bytes    = endpoint.value.max_chunk_size_in_bytes
    container_name             = endpoint.value.container_name
    encoding                   = endpoint.value.encoding
    file_name_format           = endpoint.value.file_name_format
}

}

dynamic "route" {
  for_each = var.route
  content {
    name           = route.value.name
    source         = route.value.source
    condition      = route.value.condition
    endpoint_names = route.value.endpoint_names
    enabled        = route.value.enabled
  }
}


dynamic "enrichment" {
  for_each = var.enrichment
  content {
    key = enrichment.value.key
    value = enrichment.value.value
    endpoint_names = enrichment.value.endpoint_names
  }
}


dynamic "cloud_to_device" {
  for_each = var.cloud_to_device != null ? [1] : []
  content {
    max_delivery_count = var.cloud_to_device.max_delivery_count
    default_ttl = var.cloud_to_device.default_ttl
  
  dynamic "feedback" {
    for_each = var.cloud_to_device.feedback != null ? [1] : []
    content {
      time_to_live = var.cloud_to_device.feedback.time_to_live
      max_delivery_count = var.cloud_to_device.feedback.max_delivery_count
      lock_duration = var.cloud_to_device.feedback.lock_duration
    }
  }
 }
}

}