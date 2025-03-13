# Resource Group Module (main.tf)

module "global_variables" {
  source = "../base-infrastructure/global-variables"
}

resource "azurerm_resource_group" "rg" {
  name     = "${module.base-infrastructure.global-variables[var.product]}-${module.base-infrastructure.global-variables[var.environment]}-${module.base-infrastructure.global-variables[var.location]}-rg"
  location = lookup(local.location_map, var.location, "centralindia")
}
