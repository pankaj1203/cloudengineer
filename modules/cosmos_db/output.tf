output "location" {
    value = azurerm_cosmosdb_account.db.location
}

output "name" {
    value = azurerm_cosmosdb_mongo_database.cosmosdb_mongo_database.name
}

output "cosmos_mongo_database" {
    value = azurerm_cosmosdb_mongo_database.cosmosdb_mongo_database.id
}
