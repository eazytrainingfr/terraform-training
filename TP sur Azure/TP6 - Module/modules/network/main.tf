resource "azurerm_virtual_network" "tfeazytraining-vnet" {
  name                = "my-eazytraining-vnet"
  location            = var.rg-location
  resource_group_name = var.rg-name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "my-eazytraining-env"
  }
}

# Create a Subnet in the Virtual Network
resource "azurerm_subnet" "tfeazytraining-subnet" {
  name                 = "my-eazytraining-subnet"
  resource_group_name  = var.rg-name
  virtual_network_name = var.network-name
  address_prefixes     = var.network-address[0]
}