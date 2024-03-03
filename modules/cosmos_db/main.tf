resource "azurerm_cosmosdb_account" "db" {
  name                = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = var.kind

dynamic "capabilities" {
    for_each = var.capabilities != null ? [1] : []
    content {
        name = var.capabilities.name
    }
}

dynamic "consistency_policy" {
    for_each = var.consistency_policy != null ? [1] : []
    content {
        consistency_level = var.consistency_policy.consistency_level
    }
}

dynamic "geo_location" {
    for_each = var.geo_location != null ? [1] : []
    content = {
        location = var.geo_location.location
        failover_priority = var.geo_location.failover_priority
    }
}
resource "azurerm_cosmosdb_mongo_database" "cosmosdb_mongo_database" {
  name = cosmos_mongo_database_name
  account_name = var.account_name
}

resource "azurerm_cosmosdb_mongo_user_definition" "cosmosdb_mongo_user_definition" {
  cosmos_mongo_database_id = var.cosmosdb_mongo_user_definition_id
  username                 = var.username
  password                 = var.password
}
}







