module "resource_group" {
  source      = "./modules/resource_group"
}

module "vnet" {
  source      = "./modules/vnet"
  vnet_name   = module.vnet.vnet_name
  resource_group_name  = module.resource_group.rg_name
}

module "subnet" {
  source      = "./modules/subnet"
  vnet_name   = module.vnet.vnet_name
  subnet_name = module.subnet.subnet_name
  resource_group_name  = module.resource_group.rg_name
}

module "sql_mi" {
  source      = "./modules/sql_mi"
  vnet_name   = module.vnet.vnet_name
  subnet_id = module.subnet.subnet_id
  resource_group_name  = module.resource_group.rg_name
}

module "sqldatabase" {
  source      = "./modules/sqldatabase"
  vnet_name   = module.vnet.vnet_name
  subnet_id = module.subnet.subnet_id
  resource_group_name  = module.resource_group.rg_name
  sql_mi               = module.sql_mi.sqlmi_name
  mssql_server_id      = module.sql_mi.mssql_server_id
}