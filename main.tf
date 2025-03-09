module "resource_group" {
  source      = "./modules/resource_group"
  product     = var.product
  environment = var.environment
  location    = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = module.resource_group.rg_name
}

module "subnet" {
  source              = "./modules/subnet"
  resource_group_name = module.resource_group.rg_name
  vnet_name           = module.vnet.vnet_name
}

module "sql_mi" {
  source              = "./modules/sql_mi"
  resource_group_name = module.resource_group.rg_name
  vnet_name           = module.vnet.vnet_name
}
