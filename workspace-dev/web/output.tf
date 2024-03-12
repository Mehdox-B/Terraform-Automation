//------This File is for Sending data as output for child Module----//
output "web-container-storage-name" {
  value = azurerm_storage_account.hashicorp_iac_storage_account.name
}