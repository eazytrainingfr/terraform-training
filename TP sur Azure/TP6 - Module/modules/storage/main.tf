resource "azurerm_storage_account" "eazytraining-sa" {
  name                     = "storage-account-azure-votreprenom-eazytraining"
  resource_group_name      = var.rg-name
  location                 = var.rg-location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "eazytraining-container" {
  name                  = "eazytraining-container"
  storage_account_name  = var.rg-name
  container_access_type = var.container_access_type
}