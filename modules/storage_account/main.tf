resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = "west europe"
  account_tier             = var.account_tier
  account_replication_type = "LRS"
  dynamic "identity" {
    for_each = var.identity  != null ? [1] : []
    content {
      type = var.identity.type
    }
}
   dynamic "blob_properties" {
    for_each = var.blob_properties != null ? [1] : []
    content {
      versioning_enabled = var.blob_properties.versioning_enabled
   
    dynamic "delete_retention_policy" {
    for_each = var.blob_properties.delete_retention_policy != null ? [1] : []
    content {
     days = var.blob_properties.delete_retention_policy.days
    }
   }
   dynamic "container_delete_retention_policy" {
    for_each = var.blob_properties.container_delete_retention_policy != null ? [1] : []
    content {
        days = var.blob_properties.container_delete_retention_policy.days
    }
   }
   dynamic"cors_rule" {
    for_each = var.blob_properties.cors_rule != null ? [1] : []
content {
   allowed_headers = var.blob_properties.cors_rule.allowed_headers
   allowed_methods = var.blob_properties.cors_rule.allowed_methods
   allowed_origins = var.blob_properties.cors_rule.allowed_origins
   exposed_headers = var.blob_properties.cors_rule.exposed_headers
   max_age_in_seconds = var.blob_properties.cors_rule.max_age_in_seconds
    }
   }
   }
}
}