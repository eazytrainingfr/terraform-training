resource "azurerm_resource_group" "tfeazytraining-gp" {
  name     = "my-eazytraining-rg"
  location = "West Europe"
}

# Create a Virtual Network
resource "azurerm_virtual_network" "tfeazytraining-vnet" {
  name                = "my-eazytraining-vnet"
  location            = azurerm_resource_group.tfeazytraining-gp.location
  resource_group_name = azurerm_resource_group.tfeazytraining-gp.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "my-eazytraining-env"
  }
}

# Create a Subnet in the Virtual Network
resource "azurerm_subnet" "tfeazytraining-subnet" {
  name                 = "my-eazytraining-subnet"
  resource_group_name  = azurerm_resource_group.tfeazytraining-gp.name
  virtual_network_name = azurerm_virtual_network.tfeazytraining-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}


# Create a Network Security Group and rule
resource "azurerm_network_security_group" "tfeazytraining-nsg" {
  name                = "my-eazytraining-nsg"
  location            = azurerm_resource_group.tfeazytraining.location
  resource_group_name = azurerm_resource_group.tfeazytraining-gp.name

  tags = {
    environment = "my-eazytraining-env"
  }
}

# Create a Network Interface
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

# Create a Network Interface Security Group association
resource "azurerm_network_interface_security_group_association" "tfeazytraining-assoc" {
  network_interface_id      = azurerm_network_interface.tfeazytraining-vnic.id
  network_security_group_id = azurerm_network_security_group.tfeazytraining-sg.id
}

# Create a Virtual Machine
resource "azurerm_linux_virtual_machine" "tfeazytraining-vm" {
  name                            = "my-eazytraining-vm"
  location                        = azurerm_resource_group.tfeazytraining-gp.location
  resource_group_name             = azurerm_resource_group.tfeazytraining-gp.name
  network_interface_ids           = [azurerm_network_interface.tfeazytraining-vnic.id]
  size                            = ""
  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  admin_password                  = "Password1234!"
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  
  os_disk {
    name                 = "my-eazytraining-os-disk"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
	
  tags = {
    environment = "my-eazytraining-env"
  }
}

