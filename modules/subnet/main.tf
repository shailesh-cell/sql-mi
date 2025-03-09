resource "azurerm_subnet" "subnet" {
  name                 = "${var.product}-${var.environment}-sqlsubnet-${var.location}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_address_space]
}
