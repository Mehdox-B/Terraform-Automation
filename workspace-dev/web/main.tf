//---------Create a Storage Account resource---------//
resource "azurerm_storage_account" "hashicorp_iac_storage_account" {
  name                     = "mehdibenwebcontent"
  resource_group_name      = var.resource_group_name_web
  location                 = var.resource_group_location_web
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  //-----Hosting a static application insid the Storage Accout-------//
  static_website {
    index_document     = "home.html"
    error_404_document = "error.html"
  }
}
//-----Creat a Blob Service That will host The static website-----//
resource "azurerm_storage_blob" "static_content" {
  name                   = "home.html"
  storage_account_name   = azurerm_storage_account.hashicorp_iac_storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "workspace-dev/web/Static/home.html"
}
