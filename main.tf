module "resource_group" {
  source = "./modules/resource-group"
  resource_group_name = var.resource_group_name
  location = var.location
}
module "cosmosdb_postgresql_cluster" {
    source = "./modules/cosmos-db-postgres"
    cosmosdb_postgresql_role_name   = "examplecluster"
    resource_group_name             = var.resource_group_name
    location                        = var.location
    administrator_login_password    = "H@Sh1CoR3!"
    coordinator_storage_quota_in_mb = 131072
    coordinator_vcore_count         = 2
    node_count                      = 0
}

module "app_service" {
    source = "./modules/webapp"
    name   = "example-app-service"
    location            = var.location
    resource_group_name = var.resource_group_name
    site_config = {
        dotnet_framework_version = "v6.0"
        scm_type                 = "LocalGit"
    }

    connection_string = {
        name  = "Database"
        type  = "SQLServer"
        value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
    }

    sku =  {
        tier = "Standard"
        size = "S1"
    }

}
