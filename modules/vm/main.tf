resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group
  enable_ip_forwarding = var.ip_forwarding

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_network_interface" "nic" {
  name = "${var.vm_name}-nic"
  resource_group_name = var.resource_group
  depends_on = [
    azurerm_network_interface.nic
  ]
  
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "clouduser"
  admin_password      = "Password1234"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

data "azurerm_virtual_machine" "vm" {
  name = var.vm_name
  resource_group_name = var.resource_group
  depends_on = [
    azurerm_windows_virtual_machine.vm
  ]
}