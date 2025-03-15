# Resource Group Module (main.tf)

resource "azurerm_resource_group" "rg" {
  name     = "var.product-var.environment-var.location-rg"
  location = lookup(local.location_map, var.location)
  tags     = "var.tags"
}
