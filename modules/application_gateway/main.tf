resource "azurerm_public_ip" "publicip" {
  name                = "${var.product}-${var.environment}-agw-pip-${var.location}"
  resource_group_name = var.resource_group_name
  location            = lookup(local.location_map, var.location)
  allocation_method   = var.allocation_method  # Static or Dynamic need to be added in variable
}

# Local variables for maintainability
locals {
  backend_address_pool_name      = "${var.product}-${var.environment}-beap-${var.location}"
  frontend_port_name             = "${var.product}-${var.environment}-feport-${var.location}"
  frontend_ip_configuration_name = "${var.product}-${var.environment}-feip-${var.location}"  # Fixed name mismatch
  http_setting_name              = "${var.product}-${var.environment}-be-htst-${var.location}"
  listener_name                  = "${var.product}-${var.environment}-httplstn-${var.location}"
  request_routing_rule_name      = "${var.product}-${var.environment}-rqrt-${var.location}"
  redirect_configuration_name    = "${var.product}-${var.environment}-rdrcfg-${var.location}"
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
    subnet_id = var.subnet1_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.publicip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
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
    frontend_ip_configuration_name = local.frontend_ip_configuration_name  # Fixed mismatch
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

  depends_on = [azurerm_public_ip.publicip]  # Ensures Public IP is created first
}
