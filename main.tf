module "resource_group" {
  source = "./modules/resource_group"

  name = "az_demo_001"
}

module "virtual_network" {
  source = "./modules/virtual_network"
  virtual_network_name = "vnet_001"
  address_space = ["10.0.0.0/16"]
  resource_group_name = module.resource_group.name
  subnet_name = "snet"
  network_security_group_name = "nsg1"
  rules = {
      name                     = "allow-80",
      priority                 = 103,
      direction                = "Inbound",
      access                   = "Allow",
      protocol                 = "Tcp",
      source_port_range        = "*",
      destination_port_range   = "80",
      source_address_prefix    = "*",
      destination_address_prefix = "VirtualNetwork"}

    
}
