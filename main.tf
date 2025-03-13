module "global_variables" {
  source = "./modules/base-infrastructure/global-variables"
}

module "resource_group" {
  source      = "./modules/resource_group"
  product     = module.global_variables.product
  environment = module.global_variables.environment
  location    = module.global_variables.location
  location_map = module.global_variables.location_map
}

#module "vnet" {
#  source      = "./modules/vnet"
#  vnet_name   = module.vnet.vnet_name
#  resource_group_name  = module.resource_group.rg_name
#}

#module "subnet" {
#  source      = "./modules/subnet"
#  vnet_name   = module.vnet.vnet_name
#  subnet_name = module.subnet.subnet_name
#  resource_group_name  = module.resource_group.rg_name
#}

#module "applicationgateway" {
#  source      = "./modules/application_gateway"
#  vnet_name   = module.vnet.vnet_name
#  subnet1_id = module.subnet.subnet1_id
#  resource_group_name  = module.resource_group.rg_name
#}