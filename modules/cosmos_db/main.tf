
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = var.cosmosdb.name
  location            = var.cosmosdb.location
  resource_group_name = var.cosmosdb.resource_group_name
  offer_type          = var.cosmosdb.offer_type
  kind                = var.cosmosdb.kind

  enable_automatic_failover = var.cosmosdb.enable_automatic_failover

dynamic "consistency_policy" {
    for_each = var.consistency_policy != null ? [1] : []
    content {
      consistency_level = var.consistency_policy.consistency_level
      max_interval_in_seconds = var.consistency_policy.max_interval_in_seconds
      max_staleness_prefix = var.consistency_policy.max_staleness_prefix
    }  
}


dynamic "geo_location" {
    for_each = var.geo_location != null ? [1] : []
    content {
      location = var.geo_location.location
      failover_priority = var.geo_location.failover_priority
    }
}
}