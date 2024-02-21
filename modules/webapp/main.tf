resource "azurerm_app_service_plan" "app_service_plan" {
    name = var.name
    location = var.location
    resource_group_name = var.resource_group_name
    dynamic "sku"  {
        for_each = var.sku
        content{
            tier = sku.value.tier
            size = sku.value.tier
        }
    }
}

resource "azurerm_app_service" "app_service" {
    name = var.app_service_name
    resource_group_name = var.resource_group_name
    app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
    location = var.location
    dynamic "site_config" {
        for_each = var.site_config
        content {
            dotnet_framework_version = site_config.value.dotnet_framework_version
            scm_type = site_config.value.scm_type
        }
    }
    dynamic "connection_string" {
        for_each = var.connection_string
        content {
          name = connection_string.value.name
          type = connection_string.value.type
          value = connection_string.value.value
        }

    }
}
