data "azurerm_platform_image" "eazytraining-image" {
  location  = "West Europe"
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "18_04-lts"
}


resource "azurerm_virtual_machine_extension" "vm-extension" {
  name                 = "hostname"
  virtual_machine_id   = azurerm_linux_virtual_machine.tfeazytraining-vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
    {
      "commandToExecute": "sudo apt-get install -y nginx ; sudo systemctl enable --now nginx"
    }
  SETTINGS

  tags = {
    environment = "my-terraform-env"
  }
}

resource "azurerm_network_interface" "tfeazytraining-vnic" {
  name                = "my-eazytraining-nic"
  location            = azurerm_resource_group.tfeazytraining-gp.location
  resource_group_name = azurerm_resource_group.tfeazytraining-gp.name

  ip_configuration {
    name                          = "my-eazytraining-nic-ip"
    subnet_id                     = azurerm_subnet.tfeazytraining-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tfeazytraining.id
  }

  tags = {
    environment = "my-eazytraining-env"
  }
}

resource "azurerm_linux_virtual_machine" "tfeazytraining-vm" {
  name                            = "my-eazytraining-vm"
  location                        = var.rg-location
  resource_group_name             = var.rg-name
  network_interface_ids           = [azurerm_network_interface.tfeazytraining-vnic.id]
  size                            = var.instance_template
  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  admin_password                  = "Password1234!"
  disable_password_authentication = false

    source_image_reference {
    publisher = data.azurerm_platform_image.eazytraining-image.publisher
    offer     = data.azurerm_platform_image.eazytraining-image.offer
    sku       = data.azurerm_platform_image.eazytraining-image.sku
    version   = data.azurerm_platform_image.eazytraining-image.version
  }
  
  os_disk {
    name                 = "my-eazytraining-os-disk"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
   provisioner "local-exec" {
     command = "echo ${azurerm_linux_virtual_machine.tfeazytraining-vm.name}:  ${azurerm_public_ip.tfeazytraining-ip.ip_address} >> ip_address.txt"
	}
	
  tags = {
    environment = "my-eazytraining-env"
  }
}