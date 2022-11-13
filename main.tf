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
    
    subscription_id = var.subscriptionid
    client_id = var.clientid
    client_secret = var.clientsecret
    tenant_id = var.tenantid
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
  resource_group_name      = "rgcurso" 
  location                 = "francecentral"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
