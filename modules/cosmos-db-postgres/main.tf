resource "azurerm_cosmosdb_postgresql_cluster" "cosmosdb_postgresql_cluster" {
    name = var.name
    resource_group_name = var.resource_group_name
    location = var.location
    administrator_login_password = var.administrator_login_password
    coordinator_storage_quota_in_mb = var.coordinator_storage_quota_in_mb
    coordinator_vcore_count = var.coordinator_vcore_count
    node_count = var.node_count

}

resource "azurerm_cosmosdb_postgresql_role" "cosmosdb_postgresql_role" {
  name       = var.cosmosdb_postgresql_role_name
  cluster_id = azurerm_cosmosdb_postgresql_cluster.cosmosdb_postgresql_cluster.id
  password   = var.administrator_login_password
}

