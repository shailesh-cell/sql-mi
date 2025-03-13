resource "azurerm_public_ip" "publicip" {
  name                = "${var.product}-${var.environment}-agw-pip-${var.location}"
  resource_group_name = var.resource_group_name
  location            = lookup(local.location_map, var.location)
  allocation_method   = var.allocation_method  # Static or Dynamic need to added in variable
}


# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${var.vnet_name}-beap"
  frontend_port_name             = "${var.vnet_name}-feport"
  frontend_ip_configuration_name = "${var.vnet_name}-feip"
  http_setting_name              = "${var.vnet_name}-be-htst"
  listener_name                  = "${var.vnet_name}-httplstn"
  request_routing_rule_name      = "${var.vnet_name}-rqrt"
  redirect_configuration_name    = "${var.vnet_name}-rdrcfg"
}

resource "azurerm_application_gateway" "agw" {
  name                = "${var.product}-${var.environment}-agw-${var.location}"
  resource_group_name = var.resource_group_name
  location            = lookup(local.location_map, var.location)

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "${var.product}-${var.environment}-gip-${var.location}"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "${var.product}-${var.environment}-fep-${var.location}"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "${var.product}-${var.environment}-feip-${var.location}"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }

  backend_address_pool {
    name = "${var.product}-${var.environment}-bap-${var.location}"
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
 }