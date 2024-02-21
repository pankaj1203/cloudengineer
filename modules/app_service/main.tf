resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "sku" {
     for_each = var.sku != null ? [1] : []
        content {
            tier = var.sku.tier
            size = var.sku.size
        }
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

dynamic "site_config" {
    for_each = var.site_config != null ? [1] : []
    content {
        dotnet_framework_version = var.site_config.dotnet_framework_version
        scm_type                 = var.site_config.scm_type
    }
}


dynamic "connection_string" {
    for_each = var.connection_string != null ? [1] : []
    content {
        name = var.connection_string.name
        type = var.connection_string.type
        value = var.connection_string.value
    }
}
}










