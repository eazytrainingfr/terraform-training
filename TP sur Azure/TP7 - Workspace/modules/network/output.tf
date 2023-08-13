output "vnet_id" {
  value    = azurerm_virtual_network.tfeazytraining-vnet.id
}

output "subnet_id" {
  value    = azurerm_subnet.tfeazytraining-subnet.id
}