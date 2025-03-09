module "resource_group" {
  source      = "./modules/resource_group"
}

module "vnet" {
  source      = "./modules/vnet"
  vnet_name   = module.vnet.vnet_name
  resource_group_name  = module.resource_group.rg_name
}

module "subnet" {
  source      = "./modules/vnet"
  vnet_name   = module.vnet.vnet_name
  subnet_name = module.vnet.subnet_name
  resource_group_name  = module.resource_group.rg_name
}