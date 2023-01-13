resource "null_resource" "install_remote_access" {
  provisioner "remote-exec" {
    inline = [
      "powershell -Command 'Install-WindowsFeature RemoteAccess -IncludeManagementTools'"
    ]
    connection {
      type     = "ssh"
      user     = module.vm0.username
      password = module.vm0.password
      host     = module.pip4.pip.ip_address
    }
  }
}