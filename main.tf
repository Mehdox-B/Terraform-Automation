terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }

backend "azurerm" {
    resource_group_name  = "Hashicorp_Iac_Project"
    storage_account_name = "hashicorpstorageaccount"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}
//---------Create a resource Groupe-------------//
resource "azurerm_resource_group" "hashicorp_iac_azure_resources" {
  name     = "Hashicorp_Iac_Project"
  location = "eastus"
  tags = {
    environment = "dev"
  }
}
//------Create a Virtual Network in Azure-------//
resource "azurerm_virtual_network" "hashicorp_iac_vin" {
  name                = "hashicorpvirtualnetwork"
  resource_group_name = azurerm_resource_group.hashicorp_iac_azure_resources.name
  location            = azurerm_resource_group.hashicorp_iac_azure_resources.location
  address_space       = ["10.123.0.0/16"]
  tags = {
    environment = "dev"
  }
}
//-----Create a subnet for the previous virtual Network------//
resource "azurerm_subnet" "hashicorp_iac_subnet" {
  name                 = "hashicorp-virtual-subnetnetwork"
  resource_group_name  = azurerm_resource_group.hashicorp_iac_azure_resources.name
  virtual_network_name = azurerm_virtual_network.hashicorp_iac_vin.name
  address_prefixes     = ["10.123.1.0/24"]

}
//---------Create a Storage Account resource---------//
resource "azurerm_storage_account" "hashicorp_iac_storage_account" {
  name                     = "hashicorpstorageaccount"
  resource_group_name      = azurerm_resource_group.hashicorp_iac_azure_resources.name
  location                 = azurerm_resource_group.hashicorp_iac_azure_resources.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  //-----Hosting a static application insid the Storage Accout-------//
  static_website {
    index_document     = "home.html"
    error_404_document = "error.html"
  }
}
//------Creat a Blob Service That will host The static website-----//
resource "azurerm_storage_blob" "static_content" {
  name                   = "home.html"
  storage_account_name   = azurerm_storage_account.hashicorp_iac_storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "./Static/home.html"
}