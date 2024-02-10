resource "azurerm_virtual_network" "virtul_network" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtul_network.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

dynamic "security_rule" {
  for_each = var.rules != null ? [1] : []
  content {
    name                       = var.rules.name
    priority                   = var.rules.priority
    direction                  = var.rules.direction
    access                     = var.rules.access
    protocol                   = var.rules.protocol
    source_port_range          = var.rules.source_port_range
    destination_port_range     = var.rules.destination_port_range
    source_address_prefix      = var.rules.source_address_prefix
    destination_address_prefix = var.rules.destination_address_prefix

  }
} 
}
