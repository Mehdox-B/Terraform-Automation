terraform {
  required_version = ">= 1.5.7"
  backend "azurerm" {
    resource_group_name  = "Hashicorp_Iac_Project"
    storage_account_name = "hashicorpstorageaccount"
    container_name       = "tfstatefile"
    key                  = "terraform-azurerm.tfstate"
  }
}
 
provider "azurerm" {
  features {}
}