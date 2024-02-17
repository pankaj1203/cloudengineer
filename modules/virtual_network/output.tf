output "virtual_network_id" {
    value = azurerm_virtual_network.virtul_network.id
}

output "virtual_network_name" {
    value = azurerm_virtual_network.virtul_network.name
}

output "subnet_id" {
    value = azurerm_subnet.subnet.id
}