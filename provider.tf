terraform {
  backend "azurerm" {
    resource_group_name  = "Hashicorp_Iac_Project"
    storage_account_name = "hashicorpstorageaccount"
    container_name       = "tfstatefile"
    key                  = "tfstate"
  }
}