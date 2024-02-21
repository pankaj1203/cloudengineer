
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.90.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = "a8843092-ed33-44d4-ac1c-a9b2faa01b66"
  client_secret   =  "snf8Q~QH~opX~cBOCqMsH7Zm85dyB5C_zyG4Wce_"
  tenant_id       = "7d213e29-ba80-4537-b668-dbb0c5e886ed"
  subscription_id = "9ee2422e-0e6f-42bd-9f9e-aaa29ad40bb8"
}
