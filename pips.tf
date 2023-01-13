 module "pip4" {
   source   = "./modules/pip"
   pip_name = "az104-06-pip4"
   rg_name  = module.rg4.rg.name
 }

# module "pip5" {
#   source   = "./modules/pip"
#   pip_name = "az104-06-pip5"
#   rg_name  = module.rg5.rg.name
# }