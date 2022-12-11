resource "azurerm_public_ip" "pip4" {
  name                = "az104-06-pip4"
  resource_group_name = module.rg1.rg_name
  location            = var.location
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_public_ip" "pip5" {
  name                = "az104-06-pip5"
  resource_group_name = module.rg1.rg_name
  location            = var.location
  allocation_method   = "Static"
  sku = "Standard"
}