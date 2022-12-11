# resource "azurerm_network_interface" "main" {
#   name                = "${var.vm_name}-nic"
#   location            = var.location
#   resource_group_name = var.resource_group

#   ip_configuration {
#     name                          = "configuration1"
#     subnet_id                     = var.subnet_id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_windows_virtual_machine" "main" {
#   name                  = var.vm_name
#   location              = var.location
#   resource_group_name   = var.resource_group
#   network_interface_ids = [azurerm_network_interface.main.id]
#   vm_size               = "Standard_B1s"
#   admin_username      = "clouduser"
#    admin_password      = "Password1234"
 
  

#   # Uncomment this line to delete the OS disk automatically when deleting the VM
#   # delete_os_disk_on_termination = true

#   # Uncomment this line to delete the data disks automatically when deleting the VM
#   # delete_data_disks_on_termination = true

#   storage_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-Datacenter"
#     version   = "latest"
#   }
#   os_disk {
  
#     caching           = "ReadWrite"
#     storage_account_type =  "Standard_LRS"
#   }



# }



# # resource "azurerm_network_interface" "main" {
# #   name                 = "${var.vm0_name}-nic"
# #   location             = var.location
# #   resource_group_name  = azurerm_resource_group.rg1.name


# #   ip_configuration {
# #     name                          = "configuration1"
# #     subnet_id                     = var.subnet_id
# #     private_ip_address_allocation = "Dynamic"
# #   }
# # }

# # resource "azurerm_windows_virtual_machine" "vm0" {
# #   name                = var.vm0_name
# #   resource_group_name = azurerm_resource_group.rg1.name
# #   location            = var.location
# #   size                = "Standard_B1s"
# #   admin_username      = var.vm0_username
# #   admin_password      = var.vm0_password
# #   network_interface_ids = [
# #     azurerm_network_interface.vm0_nic.id,
# #   ]

# #   os_disk {
# #     caching              = "ReadWrite"
# #     storage_account_type = "Standard_LRS"
# #   }

# # source_image_reference {
# #     publisher = "MicrosoftWindowsServer"
# #     offer     = "WindowsServer"
# #     sku       = "2019-Datacenter"
# #     version   = "latest"
# #   }
# # }


resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
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