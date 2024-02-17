output "name" {
    value = azurerm_storage_account.storage_account.name

}

output "blob" {
    value = azurerm_storage_account.storage_account.primary_blob_connection_string

}