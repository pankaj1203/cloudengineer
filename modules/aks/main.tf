resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix


dynamic "default_node_pool" {
  for_each = var.default_node_pool != null ? [1] : []
  content {
    name       = var.default_node_pool.name
    node_count = var.default_node_pool.node_count
    vm_size    = var.default_node_pool.vm_size
    dynamic "linux_os_config" {
    for_each = var.default_node_pool.linux_os_config != null ? [1] : []
    content {
      swap_file_size_mb              =  var.default_node_pool.linux_os_config.swap_file_size_mb
      transparent_huge_page_defrag   =  var.default_node_pool.linux_os_config.transparent_huge_page_defrag
      transparent_huge_page_enabled  =  var.default_node_pool.linux_os_config.transparent_huge_page_enabled
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

ingress_application_gateway {
 gateway_name = var.gateway_name
 subnet_id = var.subnet_id
}
}

resource "azurerm_kubernetes_cluster_node_pool" "user_node_pool" {
  name                  = var.user_node_pool
  kubernetes_cluster_id = var.kubernetes_cluster_id
  vm_size               = var.vm_size
  node_count            = var.node_count

  # tags = {
  #   Environment = var.tags.environment
  # }

# dynamic "user_node_pool" {
#   for_each = var.user_node_pool != null ? [1] : []
#   content {
#     name = var.node_pool
#     kubernetes_cluster_id = var.kubernetes_cluster_id
#     vm_size = var.vm_size
#     node_count = var.node_count
#   }
# }
}
