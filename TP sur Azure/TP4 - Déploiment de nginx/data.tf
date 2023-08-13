data "azurerm_platform_image" "eazytraining-image" {
  location  = "West Europe"
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "18_04-lts"
}
