# SQL Managed Database (main.tf)
resource "azurerm_mssql_database" "sql_database" {
  name                         = "${var.product}-${var.environment}-sqldb-${var.location}"
  server_id                    = var.mssql_server_id
  license_type                 = var.license_type
  max_size_gb                  = var.database_size
  sku_name                     = var.sku_name_db
}
