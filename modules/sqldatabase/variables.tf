variable "location" {
  type    = string
  default = "cin"
  validation {
    condition     = contains(["cin", "cus"], var.location)
    error_message = "Allowed values: cin, cus."
  }
}

# Map short codes to full region names
locals {
  location_map = {
    cin = "centralindia"
    cus = "centralus"
  }
}

# Use the full region name in resource definitions
output "full_location" {
  value = lookup(local.location_map, var.location, "centralindia")
}

variable "environment" {
  type    = string
  default = "dev"
  validation {
    condition     = contains(["dev", "uat", "prod"], var.environment)
    error_message = "Allowed values: dev, uat, prod."
  }
}

variable "product" {
  type    = string
  default = "dbuh"
  validation {
    condition     = contains(["dbuh", "ubuh", "pbuh"], var.product)
    error_message = "Allowed values: dbuh, ubuh, pbuh."
  }
}

variable "license_type" {
  type    = string
  default = "LicenseIncluded"
  validation {
    condition     = contains(["LicenseIncluded", "BasePrice"], var.license_type)
    error_message = "Allowed values: LicenseIncluded, BasePrice."
  }
}

# SQL Managed Instance Module (variables.tf)
variable "sku_name_db" {
  type    = string
  default = "Basic"
  validation {
    condition     = contains(["GP_S_Gen5_2", "HS_Gen4_1", "BC_Gen5_2", "ElasticPool", "Basic", "S0", "P2", "DW100c", "DS100"], var.sku_name_db)
    error_message = "Allowed values: GP_S_Gen5_2, HS_Gen4_1, BC_Gen5_2, ElasticPool, Basic, S0, P2, DW100c, DS100 ."
  }
}

variable "database_size" {
  type    = number
  default = 2
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "mssql_server_id" {
  description = "The Azure Resource ID of the SQL Server"
  type        = string
}
