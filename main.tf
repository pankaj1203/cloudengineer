module "resource_group" {
  source = "./modules/resource_group"

  name = "az_demo_001"
}

module "virtual_network" {
  source = "./modules/virtual_network"
  virtual_network_name = "vnet_001"
  address_space = ["10.0.0.0/16"]
  resource_group_name = module.resource_group.name
  subnet_name = "snet_001"
  address_prefixes = [ "10.0.0.0/22" ]
  }