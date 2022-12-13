module "Iis_vm0" {
  source = "./modules/install_iis"
  vm_id  = module.vm0.vm.id

}

module "Iis_vm1" {
  source = "./modules/install_iis"
  vm_id  = module.vm1.vm.id

}

module "Iis_vm2" {
  source = "./modules/install_iis"
  vm_id  = module.vm2.vm.id

}

module "Iis_vm3" {
  source = "./modules/install_iis"
  vm_id  = module.vm3.vm.id

}