resource "azurerm_automation_account" "automationaccount" {
  name                 = "${var.product}-${var.environment}-automation-${var.location}"
  resource_group_name  = var.resource_group_name
  location             = lookup(local.location_map, var.location)

  sku_name = var.sku_name_aa  # Use local variable correctly
}