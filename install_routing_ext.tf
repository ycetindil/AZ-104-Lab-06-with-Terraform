# module "routing_extension" {
#     source = "./modules/install_routing"
#     vm_id = module.vm0.vm.id
# }

# resource "azurerm_virtual_machine_extension" "ext" {
    
#   name                 = "enable-routing-nva-iptables-vm"
#   virtual_machine_id   = module.vm0.vm.id
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScriptExtension"
#   type_handler_version = "1.9"

#    settings = <<SETTINGS
#     {
#         "script": "c3VkbyBjaG1vZCA3NzcgL2V0Yy9zeXNjdGwuY29uZgplY2hvICJuZXQuaXB2NC5pcF9mb3J3YXJkID0gMSIgPiAvZXRjL3N5c2N0bC5jb25mCnN1ZG8gc3lzY3RsIC1wIC9ldGMvc3lzY3RsLmNvbmYKc3VkbyBpcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJPVVRJTkcgLWQgMTAuMC4wLjAvOCAtaiBBQ0NFUFQKc3VkbyBpcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJPVVRJTkcgLWQgMTcyLjE2LjAuMC8xMiAtaiBBQ0NFUFQKc3VkbyBpcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJPVVRJTkcgLWQgMTkyLjE2OC4wLjAvMTYgLWogQUNDRVBUCnN1ZG8gaXB0YWJsZXMgLXQgbmF0IC1BIFBPU1RST1VUSU5HIC1vIGV0aDAgLWogTUFTUVVFUkFERQ=="
#     }
# SETTINGS
# }


# resource "null_resource" "install_remote_access" {
#   provisioner "local-exec" {
#     command = "powershell Install-WindowsFeature RemoteAccess -IncludeManagementTools"
#   }
# }

# resource "null_resource" "install_remote_access" {
#   provisioner "local-exec" {
#     command = "powershell -Command 'Install-WindowsFeature -Name Routing -IncludeManagementTools -IncludeAllSubFeature; Install-WindowsFeature -Name \"RSAT-RemoteAccess-Powershell\"; Install-RemoteAccess -VpnType RoutingOnly; Get-NetAdapter | Set-NetIPInterface -Forwarding Enabled'"
#   }
# }
