resource "azurerm_resource_group" "AZ_RG_001" {
  name     = "rg_az_weu_001"
  location = var.location
}

resource "azurerm_virtual_network" "az-vnet-001" {
  name                = "az-vnet-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.AZ_RG_001.name
  address_space       = var.address_space

  subnet {
    name           = "az-vnet-001-snet-001"
    address_prefix = "10.0.0.0/23"
  }

  subnet {
    name           = "az-vnet-001-snet-002"
    address_prefix = "10.0.2.0/23"
    }
}