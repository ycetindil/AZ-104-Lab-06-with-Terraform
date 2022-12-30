resource "azurerm_virtual_machine_extension" "remote-access" {
  name                = "remote-access"
  virtual_machine_id  = var.vm_id
  publisher           = "Microsoft.Compute"
  type                = "CustomScriptExtension"
  type_handler_version = "1.9"
  settings = <<SETTINGS
    {
      "commandToExecute": "Install-WindowsFeature RemoteAccess -IncludeManagementTools"
    }
  SETTINGS
}

variable "vm_id" {
  
}