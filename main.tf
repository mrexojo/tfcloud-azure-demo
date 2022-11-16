# Provider version
terraform {
  required_version = ">= 0.15"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.30.0"
    }
  }
}
# Provideer declaration
provider "azurerm" {
    features {}
  
    subscription_id = var.SUBSCRIPTION_ID
    client_id = var.CLIENT_ID
    client_secret = var.CLIENT_SECRET
    tenant_id = var.TENANT_ID
}

#--------------------------------------
# Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name = "rgcurso"
  location = "francecentral"
}

# Azure Storage Account 
resource "azurerm_storage_account" "sa" {
  name                     = "sacurso"
  resource_group_name      = azurerm_resource_group.rg.name 
  location                 = "francecentral"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
