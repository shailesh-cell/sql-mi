# Resource Group Module (main.tf)

module "global_variables" {
  source = "./modules/base-infrastructure/global-variables"
}


resource "azurerm_resource_group" "rg" {
  name     = "${var.product}-${var.environment}-${var.location}-rg"
  location = lookup(local.location_map, var.location, "centralindia")
}
