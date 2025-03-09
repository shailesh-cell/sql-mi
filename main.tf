module "resource_group" {
  source = "./modules/resource_group"
}

module "vnet" {
  source = "./modules/vnet"
}

module "subnet" {
  source = "./modules/subnet"
}

module "sql_mi" {
  source = "./modules/sql_mi"
}
