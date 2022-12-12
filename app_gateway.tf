locals {
  backend_address_pool_name      = "${azurerm_virtual_network.vnet1.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.vnet1.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.vnet1.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.vnet1.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.vnet1.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.vnet1.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.vnet1.name}-rdrcfg"
}

resource "azurerm_application_gateway" "network" {
  name                = "appgateway"
  resource_group_name = module.rg1.rg_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.vnet1_subnetappgw.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip5.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
    ip_addresses = ["10.62.0.4", "10.63.0.4"]
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
    priority = 30
  }
}