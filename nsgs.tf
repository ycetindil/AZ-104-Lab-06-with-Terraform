module "nsg_lb" {
  source   = "./modules/nsg"
  rg_name  = module.rg1.rg.name
  nsg_name = "nsg_loadbalancer_vms"
}

module "nsg_appgw" {
  source   = "./modules/nsg"
  rg_name  = module.rg1.rg.name
  nsg_name = "nsg_appgw_vms"
}
resource "azurerm_network_interface_security_group_association" "vm0_assoc" {
  network_interface_id      = module.vm0.nic.id
  network_security_group_id = module.nsg_lb.nsg.id
}

# resource "azurerm_network_interface_security_group_association" "vm1_assoc" {
#   network_interface_id      = module.vm1.nic.id
#   network_security_group_id = module.nsg_lb.nsg.id
# }

resource "azurerm_network_interface_security_group_association" "vm2_assoc" {
  network_interface_id      = module.vm2.nic.id
  network_security_group_id = module.nsg_appgw.nsg.id
}

resource "azurerm_network_interface_security_group_association" "vm3_nsg_assoc" {
  network_interface_id      = module.vm3.nic.id
  network_security_group_id = module.nsg_appgw.nsg.id
}