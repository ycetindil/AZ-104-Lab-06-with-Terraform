module "Iis_vm0" {
    source = "./modules/install iis"
    vm_id = module.vm0.vm_id
  
}

module "Iis_vm1" {
    source = "./modules/install iis"
    vm_id = module.vm1.vm_id
  
}

module "Iis_vm2" {
    source = "./modules/install iis"
    vm_id = module.vm2.vm_id
  
}

module "Iis_vm3" {
    source = "./modules/install iis"
    vm_id = module.vm3.vm_id
  
}