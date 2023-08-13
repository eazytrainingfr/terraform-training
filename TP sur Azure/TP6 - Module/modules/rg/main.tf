resource "azurerm_resource_group" "tfeazytraining-gp" {
  name     = "my-eazytraining-rg"
  location = var.rg-location
}
