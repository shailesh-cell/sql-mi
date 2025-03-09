module "resource_group" {
  source      = "./modules/resource_group"
}

module "vnet" {
  source      = "./modules/vnet"
  vnet_name   = var.vnet_name
  resource_group_name  = var.resource_group
}