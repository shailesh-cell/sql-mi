# Resource Group Module (main.tf)

module "global_variables" {
  source = "../base-infrastructure/global-variables"
}

resource "azurerm_resource_group" "rg" {
  name     = "${base-infrastructure.global-variables[var.product]}-${base-infrastructure.global-variables[var.environment]}-${base-infrastructure.global-variables[var.location]}-rg"
  location = lookup(local.location_map, var.location, "centralindia")
}
