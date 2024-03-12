//------Create a Virtual Network in Azure-------//
resource "azurerm_virtual_network" "hashicorp_iac_vin" {
  name                = "hashicorpvirtualnetwork"
  resource_group_name = var.resource_group_name_network
  location            = var.resource_group_location_network
  address_space       = ["10.123.0.0/16"]
  tags = {
    environment = "dev"
  }
}
//-----Create a subnet for the previous virtual Network------//
resource "azurerm_subnet" "hashicorp_iac_subnet" {
  name                 = "hashicorp-virtual-subnetnetwork"
  resource_group_name  = var.resource_group_name_network
  virtual_network_name = azurerm_virtual_network.hashicorp_iac_vin.name
  address_prefixes     = ["10.123.1.0/24"]

}