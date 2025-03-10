output "sqlmi_name" {
  value = azurerm_mssql_managed_instance.sql_mi.name
}

output "mssql_server_id" {
  value = azurerm_mssql_managed_instance.sql_mi.name.id
}