resource "azurerm_network_security_group" "lb4_nsg" {
  name                = "lb4_nsg"
  location            = var.location
  resource_group_name = module.rg1.rg_name

  security_rule {
    name                       = "Open RDP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Open HTTP"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "vm0_nic" {
  network_interface_id      = module.vm0.nic_id
  network_security_group_id = azurerm_network_security_group.lb4_nsg.id
}

resource "azurerm_network_interface_security_group_association" "vm1_nic" {
  network_interface_id      = module.vm1.nic_id
  network_security_group_id = azurerm_network_security_group.lb4_nsg.id
}

resource "azurerm_network_security_group" "appgw5_nsg" {
  name                = "appgw5_nsg"
  location            = var.location
  resource_group_name = module.rg1.rg_name

  security_rule {
    name                       = "Open RDP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Open HTTP"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "vm2_nic" {
  network_interface_id      = module.vm2.nic_id
  network_security_group_id = azurerm_network_security_group.appgw5_nsg.id
}

resource "azurerm_network_interface_security_group_association" "vm3_nic" {
  network_interface_id      = module.vm3.nic_id
  network_security_group_id = azurerm_network_security_group.appgw5_nsg.id
}