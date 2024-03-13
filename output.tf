output "resource_group_name" {
  value = azurerm_resource_group.hashicorp_iac_azure_resources.name
}
output "resource_group_location" {
  value = azurerm_resource_group.hashicorp_iac_azure_resources.location
}