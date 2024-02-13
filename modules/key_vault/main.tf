resource "azurerm_key_vault" "key_vault" {
name                        = var.key_vault_name
location                    = var.location
resource_group_name         = var.resource_group_name
sku_name                    = var.sku_name
enabled_for_disk_encryption = var.enabled_for_disk_encryption
tenant_id                   = var.tenant_id
soft_delete_retention_days  = var.soft_delete_retention_days

dynamic "access_policy" {
    for_each = var.access_policy 
    content {
      tenant_id = access_policy.value.tenant_id
      object_id = access_policy.value.object_id
      key_permissions = access_policy.value.key_permissions
      secret_permissions = access_policy.value.secret_permissions
     storage_permissions = access_policy.value.storage_permissions
    }
}
}
