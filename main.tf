module "resource_group" {
  source = "./modules/resource_group"

  name = "az_demo_001"
}

module "virtual_network" {
  source                      = "./modules/virtual_network"
  virtual_network_name        = "vnet_001"
  address_space               = ["10.0.0.0/16"]
  resource_group_name         = module.resource_group.name
  subnet_name                 = join("-", ["terraform", var.subnet_name])
  address_prefixes            = ["10.0.0.0/22"]
  network_security_group_name = "nsg1"
}

module "aks" {
  source              = "./modules/aks"
  name                = "aks1"
  resource_group_name = module.resource_group.name
  dns_prefix          = "dns1"
  default_node_pool = {
    name       = "nodepool1"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    linux_os_config = {
      swap_file_size_mb             = "500"
      transparent_huge_page_defrag  = "always"
      transparent_huge_page_enabled = "always"
    }

  }

  identity = [{
    type = "SystemAssigned"
  }]
}

module "key_vault" {
  source                      = "./modules/key_vault"
  key_vault_name              = "key-vault1"
  location                    = "West Europe"
  resource_group_name         = module.resource_group.name
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  tenant_id                   = "186eab92-5232-4892-ad0f-6546d74c7b53"
  soft_delete_retention_days  = "7"
  access_policy = [{
    tenant_id = "186eab92-5232-4892-ad0f-6546d74c7b53"
    object_id = "af12891b-68ba-4cd8-926e-9638561a0e8a"

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
    },
    {
      tenant_id = "186eab92-5232-4892-ad0f-6546d74c7b53"
      object_id = "af12891b-68ba-4cd8-926e-9638561a0e8a"

      key_permissions = [
        "Get",
      ]

      secret_permissions = [
        "Get",
      ]

      storage_permissions = [
        "Get",
      ]
    }
  ]
}


module "storage_account" {
  source = "./modules/storage_account"

  storage_account_name     = "storageacc"
  resource_group_name      = "resource_group_name"
  location                 = "west europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  identity = {
    type = "SystemAssigned"
  }
  blob_properties = {
    versioning_enabled = true
    delete_retention_policy = {
      days = "7"
    }
    container_delete_retention_policy = {
      days = "7"
    }
    cors_rule = {
      allowed_headers    = ["*"]
      allowed_methods    = ["GET", "HEAD", "POST", "PUT"]
      allowed_origins    = ["https://example.com"]
      exposed_headers    = ["*"]
      max_age_in_seconds = 3600
    }
  }
}

module "iot_hub" {
  source = "./modules/iot_hub"

  iot_hub_name                 = "iot-hub"
  resource_group_name          = module.resource_group.name
  location                     = "West Europe"
  #local_authentication_enabled = false

  sku = [{
    name     = "S1"
    capacity = "1"
  }]

  endpoint = [{
    type                       = "AzureIotHub.StorageContainer"
    connection_string          = module.storage_account.blob
    name                       = "export"
    batch_frequency_in_seconds = 60
    max_chunk_size_in_bytes    = 10485760
    container_name             = "terraform-state"
    encoding                   = "Avro"
    file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
  }]

  route = [{
    name           = "export"
    source         = "DeviceMessages"
    condition      = "true"
    endpoint_names = ["export"]
    enabled        = true
  }]


  enrichment = [{
    key            = "tenant"
    value          = "$twin.tags.Tenant"
    endpoint_names = ["export", "export2"]
  }]

  cloud_to_device = {
    max_delivery_count = 30
    default_ttl        = "PT1H"
    feedback = {
      time_to_live       = "PT1H10M"
      max_delivery_count = 15
      lock_duration      = "PT30S"
    }
  }
}

module "active_directory" {
  source = "./modules/active_directory"

  name                = "active-directory"
  location            = "West Europe"
  resource_group_name = module.resource_group.name

  domain_name           = "widgetslogin.net"
  sku                   = "Enterprise"
  filtered_sync_enabled = false

  initial_replica_set = {
    subnet_id = module.virtual_network.subnet_id
  }

  notifications = {
    additional_recipients = ["notifyA@example.net", "notifyB@example.org"]
    notify_dc_admins      = true
    notify_global_admins  = true
  }

  security = [{
    sync_kerberos_passwords = true
    sync_ntlm_passwords     = true
    sync_on_prem_passwords  = true
  }]

  # tags = [{
  #   Environment = "prod"
  # }]

}

module "linux_web_app" {
  source = "./modules/linux_web_app"

service_plan = {
  name                = "service-plan"
  resource_group_name = module.resource_group.name
  location            = "West Europe"
  os_type             = "Linux"
  sku_name            = "P1v2"
}

linux_web_app = {
  name                = "linux-web-app"
  resource_group_name = module.resource_group.name
  location            = "West Europe"
  service_plan_id     = azurerm_service_plan.example.id

  site_config = {
    dotnet_version = 6.0
  }
}
}

module "cosmos_db" {
  source = "./modules/cosmos_db"
  cosmosdb            = "cosmos-db"
  location            = "West Europe"
  resource_group_name = module.resource_group.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  enable_automatic_failover = false

  consistency_policy = {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location = {
    location          = "West Europe"
    failover_priority = 1
  }
}
