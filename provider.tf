//-----Create a resource groupe container to store terraform state-----//
terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = "tamopstfstates"
    storage_account_name = "mehdibenterraformproject"
    container_name       = "tfstatedevops"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      version = "~>3.2"
      source  = "hashicorp/azurerm"
    }
  }
}