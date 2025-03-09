module "resource_group" {
  source = "./modules/resource_group"
}

module "vnet" {
  source = "./modules/vnet"
  resource_group_name = var.resource_group_name
}

module "subnet" {
  source = "./modules/subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
}

module "sql_mi" {
  source = "./modules/sql_mi"

  subnet_id                    = azurerm_subnet.subnet.id
}
