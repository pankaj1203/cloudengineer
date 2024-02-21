resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
}


resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

 dynamic "security_rule"  {
    for_each = var.security_rule
    content {
    name = security_rule.value.name
    priority = security_rule.value.priority
    direction = security_rule.value.direction
    access = security_rule.value.access
    protocol = security_rule.value.protocol
    source_port_range = security_rule.value.source_port_range
    destination_port_range = security_rule.value.destination_port_range
    source_address_prefix = security_rule.value.source_address_prefix
    destination_address_prefix = security_rule.value.destination_address_prefix
  }
 }


}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}



resource "azurerm_subnet" "subnet1" {
    name           = var.subnet_name
    address_prefixes = var.subnet_address_prefixes
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.virtual_network.name

  }
