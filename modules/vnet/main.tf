# Virtual Network Module (main.tf)
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.product}-${var.environment}-${var.location}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address_space]
}