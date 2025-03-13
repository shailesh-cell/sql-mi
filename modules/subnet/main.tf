resource "azurerm_subnet" "subnet" {
  name                 = "${var.product}-${var.environment}-sqlsubnet-${var.location}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_address_space]
  delegation {
    name = "mssql-mi-delegation"

    service_delegation {
      name = "Microsoft.Sql/managedInstances"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"
      ]
    }
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "${var.product}-${var.environment}-sqlsubnet-${var.location}-1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_address_space_1]
}

