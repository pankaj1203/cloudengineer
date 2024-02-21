resource "azurerm_storage_account" "storage_account"{
name = var.storage_account_name
resource_group_name = var.resource_group_name
location = var.location
account_tier = var.account_tier
account_replication_type = var.account_replication_type

identity {
type = var.identity.type
}


blob_properties {
    versioning_enabled = var.blob_properties.versioning_enabled
    delete_retention_policy {
      days = var.blob_properties.delete_retention_policy.days
    }
    container_delete_retention_policy {
      days = var.blob_properties.container_delete_retention_policy.days
    }
    cors_rule {
      allowed_headers = var.blob_properties.cors_rule.allowed_headers
      allowed_methods = var.blob_properties.cors_rule.allowed_methods
      allowed_origins = var.blob_properties.cors_rule.allowed_origins
      exposed_headers = var.blob_properties.cors_rule.exposed_headers
      max_age_in_seconds = var.blob_properties.cors_rule.max_age_in_seconds
    }
}
}
