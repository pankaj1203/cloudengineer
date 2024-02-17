resource "azurerm_active_directory_domain_service" "active_directory" {
  name                = var.name
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
  for_each = var.security
  content {
    sync_kerberos_passwords = security.value.sync_kerberos_passwords
    sync_ntlm_passwords     = security.value.sync_ntlm_passwords
    sync_on_prem_passwords  = security.value.sync_on_prem_passwords
  }
}

# dynamic "tags" {
#   for_each = var.tags
#   content {
#     Environment = tags.value.Environment
#   }
# }

#   depends_on = [
#     azuread_service_principal.example,
#     azurerm_subnet_network_security_group_association.deploy,
#   ]
}