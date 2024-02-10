resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix


dynamic "default_node_pool" {
  for_each = var.default_node_pool
  content {
    name       = default_node_pool.value.name
    node_count = default_node_pool.value.node_count
    vm_size    = default_node_pool.value.vm_size
  }
} 

dynamic "identity" {
  for_each = var.identity
  content {
    type = identity.value.type
  }
} 
}