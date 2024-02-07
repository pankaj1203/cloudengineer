# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "cloud-engineer-course"
      storage_account_name = "cloudenginnercourse"
      container_name       = "terraform-state"
      key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = "9229e7d9-5723-4406-943c-a0b864598b61"
}