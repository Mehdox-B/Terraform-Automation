//-----Create a resource groupe container to store terraform state-----//
terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = "Hashicorp_Iac_Project"
    storage_account_name = "hashicorpstorageaccount"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      version = "~>3.2"
      source  = "hashicorp/azurerm"
    }
  }
}