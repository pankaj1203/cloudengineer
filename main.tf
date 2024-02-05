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

resource "azurerm_network_security_group" "nseg_snet_vnet_001" {
  name                = "nseg_snet_vnet_001"
  location            =  var.location
  resource_group_name = "rg_az_weu_001"

  security_rule {
    name                       = "Deny_all"
    priority                   = 1004
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "az-vnet-001-snet-001"{
  subnet_id                 = "/subscriptions/9229e7d9-5723-4406-943c-a0b864598b61/resourceGroups/rg_az_weu_001/providers/Microsoft.Network/virtualNetworks/az-vnet-001/subnets/az-vnet-001-snet-001"
  network_security_group_id = azurerm_network_security_group.nseg_snet_vnet_001.id
}

resource "azurerm_network_security_group" "nseg_snet_2_vnet_001" {
  name                = "nseg_snet_2_vnet_001"
  location            =  var.location
  resource_group_name = "rg_az_weu_001"

  security_rule {
    name                       = "Public_Traffic"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["80","443"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "az-vnet-002"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "21"
    source_address_prefix      = "10.1.0.0/22"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Personal_Computer"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["21","3389"]
    source_address_prefix      = "127.0.0.0/32"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "az-vnet-001-snet-002"{
  subnet_id                 = "/subscriptions/9229e7d9-5723-4406-943c-a0b864598b61/resourceGroups/rg_az_weu_001/providers/Microsoft.Network/virtualNetworks/az-vnet-001/subnets/az-vnet-001-snet-002"
  network_security_group_id = azurerm_network_security_group.nseg_snet_2_vnet_001.id
}