output "location" {
    value = azurerm_cosmosdb_account.db.location
}

output "cosmos_mongo_database_name" {
    value = azurerm_cosmosdb_mongo_database.cosmosdb_mongo_database
}

output "cosmos_mongo_database_id" {
    value = azurerm_cosmosdb_mongo_database.cosmosdb_mongo_database.id

}
