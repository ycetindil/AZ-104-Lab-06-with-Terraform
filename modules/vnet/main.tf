resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = "az104-06-rg1"
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet0" {
  name                 = "${var.vnet_name}_subnet0"
  resource_group_name  = "az104-06-rg1"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.address_prefix_subnet]
}