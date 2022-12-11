resource "azurerm_virtual_network" "vnet1" {
  name                = "az104-06-vnet1"
  location            = var.location
  resource_group_name = module.rg1.rg_name
  address_space       = ["10.60.0.0/22"]
}

resource "azurerm_subnet" "vnet1_subnet0" {
  name                 = "vnet1_subnet0"
  resource_group_name  =  module.rg1.rg_name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.60.0.0/24"]
}

resource "azurerm_subnet" "vnet1_subnet1" {
  name                 = "vnet1_subnet1"
  resource_group_name  =  module.rg1.rg_name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.60.1.0/24"]
}

module "vnet2" {
  source = "./modules/vnet"
  vnet_name = "az104-06-vnet2"
  address_space = ["10.62.0.0/22"]
  address_prefix_subnet = "10.62.0.0/24"
  rg_name = module.rg1.rg_name
  }

module "vnet3" {
  source = "./modules/vnet"
  vnet_name = "az104-06-vnet3"
  address_space = ["10.63.0.0/22"]
  address_prefix_subnet = "10.63.0.0/24"
  rg_name = module.rg1.rg_name
}