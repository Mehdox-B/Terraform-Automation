//------This File is for Sending data as output for child Module----//
output "vin-adress" {
  value = azurerm_virtual_network.hashicorp_iac_vin.address_space
}