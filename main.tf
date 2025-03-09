module "resource_group" {
  source      = "./modules/resource_group"
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = module.resource_group.resource_group_name
}

module "subnet" {
  source              = "./modules/subnet"
  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = module.vnet.vnet_name
}

module "sql_mi" {
  source              = "./modules/sql_mi"
  resource_group_name = module.resource_group.resource_group_name"
  vnet_name           = module.vnet.vnet_name
}
