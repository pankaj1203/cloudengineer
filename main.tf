module "resource_group" {
  source = "./modules/resource_group"

  name = "az_demo_001"
}

# module "virtual_network" {
#   source = "./modules/virtual_network"
#   virtual_network_name = "vnet_001"
#   address_space = ["10.0.0.0/16"]
#   resource_group_name = module.resource_group.name
#   subnet_name = "snet_001"
#   address_prefixes = [ "10.0.0.0/22" ]
#   network_security_group_name = "nsg1"
#   rules = [
#   {
#       name                     = "allow-ssh",
#       priority                 = 100,
#       direction                = "Inbound",
#       access                   = "Allow",
#       protocol                 = "Tcp",
#       source_port_range        = "*",
#       destination_port_range   = "22",
#       source_address_prefix    = "*",
#       destination_address_prefix = "VirtualNetwork"
#   },
#   {
#       name                     = "allow-ftp",
#       priority                 = 101,
#       direction                = "Inbound",
#       access                   = "Allow",
#       protocol                 = "Tcp",
#       source_port_range        = "*",
#       destination_port_range   = "22",
#       source_address_prefix    = "*",
#       destination_address_prefix = "VirtualNetwork"
#   },
#   {
#      name                     = "allow-80",
#       priority                 = 103,
#       direction                = "Inbound",
#       access                   = "Allow",
#       protocol                 = "Tcp",
#       source_port_range        = "*",
#       destination_port_range   = "80",
#       source_address_prefix    = "*",
#       destination_address_prefix = "VirtualNetwork"
#   }
#  ]
#   }


module "aks" {
  source = "./modules/aks"
  resource_group_name = module.resource_group.name
  name = "azure_aks"
  dns_prefix = "azure-aks"

  default_node_pool  = [{
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }]

  identity = [{
    type = "SystemAssigned"
  }]
}