resource "azurerm_route_table" "rt23" {
  name                          = "az104-06-rt23"
  location                      = var.location
  resource_group_name           = module.rg1.rg_name

  route {
    name           = "route23"
    address_prefix = "10.63.0.0/20"
    next_hop_type  = "VirtualAppliance"
	next_hop_in_ip_address = "10.60.0.4"
  }
}

resource "azurerm_subnet_route_table_association" "srt23" {
  subnet_id      = module.vnet2.subnet_id
  route_table_id = azurerm_route_table.rt23.id
}

resource "azurerm_route_table" "rt32" {
  name                          = "az104-06-rt32"
  location                      = var.location
  resource_group_name           = module.rg1.rg_name

  route {
    name           = "route32"
    address_prefix = "10.62.0.0/20"
    next_hop_type  = "VirtualAppliance"
	next_hop_in_ip_address = "10.60.0.4"
  }
}

resource "azurerm_subnet_route_table_association" "srt32" {
  subnet_id      = module.vnet3.subnet_id
  route_table_id = azurerm_route_table.rt32.id
}