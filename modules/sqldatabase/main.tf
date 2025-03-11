# SQL Managed Database (main.tf)
resource "azurerm_mssql_database" "sql_database" {
  name                         = "${var.product}-${var.environment}-sqldb-${var.location}"
  server_id                    = var.mssql_server_id
  license_type                 = var.license_type
  max_size_gb                  = var.database_size
  sku_name                     = var.sku_name_db
  storage_account_type         = lookup(var.storage_account_type_map, var.environment)
  identity {
      type = "SystemAssigned"
}

  long_term_retention_policy {
  weekly_retention = var.weekly_retention
  monthly_retention = var.monthly_retention
  yearly_retention = var.yearly_retention
}

short_term_retention_policy {
retention_days = 1
backup_interval_in_hours = 24
}

}