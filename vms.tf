data "azurerm_subnet" "virtualSubnets1" {
    name                 = data.azurerm_virtual_network.virtualNetwork1.subnets[count.index]
    virtual_network_name = data.azurerm_virtual_network.virtualNetwork1.name
    resource_group_name  = data.azurerm_virtual_network.virtualNetwork1.resource_group_name
    count                = length(data.azurerm_virtual_network.virtualNetwork1.subnets)
}

output "virtualnetwork1_subnets_ids" {
  value = data.azurerm_subnet.virtualSubnets1.*.id
}

module "vm0" {
  source = "./modules/vm"
  vm_name = "az104-06-vm0"
  subnet_id = data.terraform_remote_state.networking.outputs.virtualnetwork1_subnets_ids[0]
}