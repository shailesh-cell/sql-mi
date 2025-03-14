# Resource Group Module (main.tf)

module "global-variables" {
  source = "./modules/global-variables"
}


resource "azurerm_resource_group" "rg" {
  name     = "${module.global-variables[var.product]}-${module.global-variables[var.environment]}-${module.global-variables[var.location]}-rg"
  location = lookup(local.location_map, var.location, "centralindia")
  tags     = "${module.global-variables[var.tags]}"
}
