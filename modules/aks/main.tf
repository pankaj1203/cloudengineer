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
    dynamic "linux_os_config" {
    for_each = var.linux_os_config
    content {
      swap_file_size_mb = linux_os_config.value.swap_file_size_mb
      transparent_huge_page_defrag   = linux_os_config.value.transparent_huge_page_defrag
      transparent_huge_page_enabled  = linux_os_config.value.transparent_huge_page_enabled
    }
  }
  
  }
  
} 

dynamic "identity" {
  for_each = var.identity
  content {
    type = identity.value.type
  }
} 
}