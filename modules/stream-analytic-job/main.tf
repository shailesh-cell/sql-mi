resource "azurerm_stream_analytics_job" "asaj" {
  name                                     = "${var.product}-${var.environment}-${var.location}-rg"
  resource_group_name                      = var.resource_group_name
  location                                 = lookup(local.location_map, var.location)
  compatibility_level                      = "1.2"
  data_locale                              = "en-US"
  events_late_arrival_max_delay_in_seconds = 5
  events_out_of_order_max_delay_in_seconds = 0
  events_out_of_order_policy               = "Adjust"
  output_error_policy                      = "Stop"
  streaming_units                          = 7
  sku_name                                 = "StandardV2"

  tags = var.tags

}
