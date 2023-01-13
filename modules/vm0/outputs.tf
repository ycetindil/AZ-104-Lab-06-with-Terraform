output "vm" {
  value = data.azurerm_virtual_machine.vm
}

output "nic" {
  value = data.azurerm_network_interface.nic
}

output "username" {
  value = azurerm_windows_virtual_machine.vm.admin_username
}

output "password" {
  value = azurerm_windows_virtual_machine.vm.admin_password
}

