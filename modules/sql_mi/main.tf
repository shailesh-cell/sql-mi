# SQL Managed Instance Module (main.tf)
resource "azurerm_mssql_managed_instance" "sql_mi" {
  name                         = "${var.product}-${var.environment}-sql-${var.location}"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  subnet_id                    = azurerm_subnet.subnet.id
  sku_name                     = var.sku_name
  storage_size_in_gb           = var.storage_size
  vcores                       = var.vcores
  license_type                 = var.license_type
}
