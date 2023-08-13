resource "azurerm_public_ip" "main" {
  for_each            = var.public_ips
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = var.sku
  tags = var.tags
}