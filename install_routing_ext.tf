module "routing_extension" {
    source = "./modules/install_routing"
    vm_id = module.vm0.vm.id
}