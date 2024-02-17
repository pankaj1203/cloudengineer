resource "azurerm_active_directory_domain_service" "domain_service" {
  name                = var.domain_service_name
  location            = var.location
  resource_group_name = var.resource_group_name

  domain_name           = var.domain_name
  sku                   = var.sku
  filtered_sync_enabled = var.filtered_sync_enabled

  dynamic "initial_replica_set" {
     for_each = var.initial_replica_set != null ? [1] : []
     content {
         subnet_id = var.initial_replica_set.subnet_id
     }
  }

  dynamic "notifications" {
    for_each = var.notifications != null ? [1] : []
    content {
    additional_recipients = var.notifications.additional_recipients
    notify_dc_admins      = var.notifications.notify_dc_admins
    notify_global_admins  = var.notifications.notify_global_admins
    }
  }
  dynamic "security" {
    for_each = var.security != null ? [1] : []
    content {
    sync_kerberos_passwords = var.security.sync_kerberos_passwords
    sync_ntlm_passwords     = var.security.sync_ntlm_passwords
    sync_on_prem_passwords  = var.security.sync_on_prem_passwords
    }
  }
}
