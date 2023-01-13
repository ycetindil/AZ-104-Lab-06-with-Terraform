# resource "azurerm_virtual_machine_extension" "remote-access" {
#   name                = "remote-access"
#   virtual_machine_id  = var.vm_id
#   publisher           = "Microsoft.Compute"
#   type                = "CustomScriptExtension"
#   type_handler_version = "1.9"
#   settings = <<SETTINGS
#     {
#       "commandToExecute": "Install-WindowsFeature RemoteAccess -IncludeManagementTools"
#     }
#   SETTINGS
# }

# variable "vm_id" {
  
# }


# resource "azurerm_virtual_machine_extension" "enable-routing-nva-iptables-vm" {
    
#   name                 = "enable-routing-nva-iptables-vm"
#   virtual_machine_id   = var.vm_id
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScript"
#   type_handler_version = "2.1"

#    settings = <<SETTINGS
#     {
#         "script": "c3VkbyBjaG1vZCA3NzcgL2V0Yy9zeXNjdGwuY29uZgplY2hvICJuZXQuaXB2NC5pcF9mb3J3YXJkID0gMSIgPiAvZXRjL3N5c2N0bC5jb25mCnN1ZG8gc3lzY3RsIC1wIC9ldGMvc3lzY3RsLmNvbmYKc3VkbyBpcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJPVVRJTkcgLWQgMTAuMC4wLjAvOCAtaiBBQ0NFUFQKc3VkbyBpcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJPVVRJTkcgLWQgMTcyLjE2LjAuMC8xMiAtaiBBQ0NFUFQKc3VkbyBpcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJPVVRJTkcgLWQgMTkyLjE2OC4wLjAvMTYgLWogQUNDRVBUCnN1ZG8gaXB0YWJsZXMgLXQgbmF0IC1BIFBPU1RST1VUSU5HIC1vIGV0aDAgLWogTUFTUVVFUkFERQ=="
#     }
# SETTINGS
# }
