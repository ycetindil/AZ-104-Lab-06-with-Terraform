
module "vm2" {
  source = "./modules/vm"
  vm_name = "az104-06-vm2"
  subnet_id = module.vnet2.subnet_id
  resource_group = module.rg1.rg_name
}

module "vm3" {
  source = "./modules/vm"
  vm_name = "az104-06-vm3"
  subnet_id = module.vnet3.subnet_id
  resource_group = module.rg1.rg_name
}

module "vm0" {
  source = "./modules/vm"
  vm_name = "az104-06-vm0"
  subnet_id = azurerm_subnet.vnet1_subnet0.id
  resource_group = module.rg1.rg_name
}

module "vm1" {
  source = "./modules/vm"
  vm_name = "az104-06-vm1"
  subnet_id = azurerm_subnet.vnet1_subnet1.id
  resource_group = module.rg1.rg_name
}