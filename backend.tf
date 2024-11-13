terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-akash"
    storage_account_name = "tfstateakash"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

  }
}