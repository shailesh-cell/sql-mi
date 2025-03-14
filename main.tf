module "resource_group" {
  source      = "./modules/resource_group"
}

module "stream_analytic_job" {
  source      = "./modules/stream-analytic-job"
  resource_group_name  = module.resource_group.rg_name
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