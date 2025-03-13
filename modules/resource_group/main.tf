# Resource Group Module (main.tf)

module "global_variables" {
  source = "./modules/base-infrastructure/global-variables"
}


resource "azurerm_resource_group" "rg" {
  name     = "${module.global_variables.product}-${module.global_variables.environment}-${module.global_variables.location}-rg"
  location = lookup(local.location_map, var.location, "centralindia")
}
