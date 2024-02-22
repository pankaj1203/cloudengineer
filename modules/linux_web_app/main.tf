resource "azurerm_resource_group" "linux_web_app" {
  name     = var.resource_group_name
  location = var.location

dynamic "service_plan" {
  for_each = var.service_plan != null ? [1] : []
  content {
  name                = var.service_plan.name
  resource_group_name = var.service_plan.resource_group_name
  location            = var.service_plan.location
  os_type             = var.service_plan.os_type
  sku_name            = var.service_plan.sku_name
  }
}

dynamic "linux_web_app" {
  for_each = var.linux_web_app != null ? [1] : []
  content {
  name                = var.linux_web_app.name
  resource_group_name = var.linux_web_app.resource_group_name
  location            = var.linux_web_app.location
  service_plan_id     = var.linux_web_app.service_plan_id

dynamic "site_config" {
    for_each = var.linux_web_app.site_config != null ? [1] : []
    content {
      dotnet_version = var.linux_web_app.site_config.dotnet_version  
    }
   }
   }
}
}