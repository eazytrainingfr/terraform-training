output "vm_public_ip" {
  value   = azurerm_public_ip.main.public_ip
}

output "vm_public_ip_id" {
  value    = azurerm_public_ip.main.id
}