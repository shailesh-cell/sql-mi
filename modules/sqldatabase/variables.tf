variable "location" {
  type    = string
  default = "wus2"
  validation {
    condition     = contains(["cin", "cus", "wus2"], var.location)
    error_message = "Allowed values: cin, cus, wus2."
  }
}

# Map short codes to full region names
locals {
  location_map = {
    cin = "centralindia"
    cus = "centralus"
    wus2 = "West US 2"
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

variable "mssql_server_id" {
  description = "The Azure Resource ID of the SQL Server"
  type        = string
}

variable "storage_account_type_map" {
  description = "Storage account type based on environment"
  type        = map(string)
  default = {
    "dev"  = "Local"
    "uat"  = "Local"
    "prod" = "Geo,Zone,GeoZone"
  }
}

variable "weekly_retention" {
  description = "Retention period in ISO 8601 duration format (e.g., PT0S, P1Y, P1M, P1W, P7D)"
  type        = string
  default     = "PT0S"
  validation {
    condition     = contains(["PT0S", "P1Y", "P1M", "P1W", "P7D"], var.weekly_retention)
    error_message = "Invalid retention period. Allowed values are PT0S, P1Y, P1M, P1W, P7D."
  }
}

variable "monthly_retention" {
  description = "Retention period in ISO 8601 duration format (e.g., PT0S, P1Y, P1M, P1W, P7D)"
  type        = string
  default     = "PT0S"
  validation {
    condition     = contains(["PT0S", "P1Y", "P1M", "P4W", "P30D"], var.monthly_retention)
    error_message = "Invalid retention period. Allowed values are PT0S, P1Y, P1M, P4W, P30D."
  }
}

variable "yearly_retention" {
  description = "Retention period in ISO 8601 duration format (e.g., PT0S, P1Y, P1M, P1W, P7D)"
  type        = string
  default     = "PT0S"
  validation {
    condition     = contains(["PT0S", "P12M", "P52W", "P365D"], var.yearly_retention)
    error_message = "Invalid retention period. Allowed values are PT0S, P12M, P52W, P365D."
  }
}

