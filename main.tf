//------Specify Azure Resource Manager as Terraform Provider-----------//
provider "azurerm" {
  features {

  }
}
//---------Create a resource Groupe for provisioning resources-------------//
resource "azurerm_resource_group" "hashicorp_iac_azure_resources" {
  name     = "Hashicorp_Iac_Dev"
  location = "eastus"
  tags = {
    environment = "dev"
  }
}
module "network" {
  source                          = "./workspace-dev/network"
  resource_group_name_network     = var.azurerm_resource_group_name
  resource_group_location_network = var.azurerm_resource_group_location
}
module "web" {
  source                      = "./workspace-dev/web"
  resource_group_name_web     = var.azurerm_resource_group_name
  resource_group_location_web = var.azurerm_resource_group_location
}