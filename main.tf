# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name #"rg-terraform-demo"
  location = var.location            #"West Europe"

}

# Create a Storage account
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name #"terraformazurenl"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

# Create a container
resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name #"data"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

# Create a file
resource "azurerm_storage_blob" "blob" {
  name                   = var.blob_container_name #"train.csv"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source                 = "data.csv"
}