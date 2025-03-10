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

variable "vnet_address_space" {
  type    = string
  default = "10.1.0.0/16"
}

variable "subnet_address_space" {
  type    = string
  default = "10.1.1.0/24"
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
variable "sku_name" {
  type    = string
  default = "BC_Gen4"
  validation {
    condition     = contains(["BC_Gen4", "BC_Gen5", "BC_Gen8IH", "BC_Gen8IM", "GP_Gen4", "GP_Gen5", "GP_Gen8IH", "GP_Gen8IM"], var.sku_name)
    error_message = "Allowed values: BC_Gen4, BC_Gen5, BC_Gen8IH, BC_Gen8IM, GP_Gen4, GP_Gen5, GP_Gen8IH, GP_Gen8IM."
  }
}

variable "admin_username" {
  type    = string
  default = "sqladmin"
}

variable "admin_password" {
  type    = string
  default = "StrongP@ssword!"
}

variable "storage_size" {
  type    = number
  default = 32
}

variable "vcores" {
  type    = number
  default = 4
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "subnet_id" {
  type        = string
}

variable "storage_account_type_map" {
  description = "Storage account type based on environment"
  type        = map(string)
  default = {
    "dev"  = "LRS"
    "uat"  = "LRS"
    "prod" = "GRS"
  }
}

variable "sql_timezone" {
  description = "Timezone for Azure SQL Managed Instance"
  type        = string
  default     = "India Standard Time"

  validation {
    condition = contains([
      "Afghanistan Standard Time", "Alaskan Standard Time", "Arab Standard Time","Arabian Standard Time","Arabic Standard Time","Argentina Standard Time","Atlantic Standard Time",
      "AUS Central Standard Time", "AUS Eastern Standard Time","Azerbaijan Standard Time","Azores Standard Time","Bahia Standard Time","Bangladesh Standard Time",
      "Belarus Standard Time", "Canada Central Standard Time","Cape Verde Standard Time","Caucasus Standard Time","Cen. Australia Standard Time","Central America Standard Time",
      "Central Asia Standard Time","Central Brazilian Standard Time","Central Europe Standard Time","Central European Standard Time","Central Pacific Standard Time",
      "Central Standard Time","China Standard Time","Dateline Standard Time","E. Africa Standard Time","E. Australia Standard Time","E. Europe Standard Time","E. South America Standard Time",
      "Eastern Standard Time","Egypt Standard Time","Ekaterinburg Standard Time","Fiji Standard Time","FLE Standard Time","Georgian Standard Time","GMT Standard Time","Greenland Standard Time",
      "Greenwich Standard Time","Hawaiian Standard Time","India Standard Time","Iran Standard Time","Israel Standard Time","Jordan Standard Time","Kaliningrad Standard Time",
      "Korea Standard Time","Libya Standard Time","Line Islands Standard Time",
      "Magadan Standard Time",
      "Mauritius Standard Time",
      "Mid-Atlantic Standard Time",
      "Middle East Standard Time",
      "Montevideo Standard Time",
      "Morocco Standard Time",
      "Mountain Standard Time",
      "Myanmar Standard Time",
      "N. Central Asia Standard Time",
      "Namibia Standard Time",
      "Nepal Standard Time",
      "New Zealand Standard Time",
      "Newfoundland Standard Time",
      "North Asia East Standard Time",
      "North Asia Standard Time",
      "Pacific SA Standard Time",
      "Pacific Standard Time",
      "Pakistan Standard Time",
      "Paraguay Standard Time",
      "Romance Standard Time",
      "Russia Time Zone 3",
      "Russian Standard Time",
      "SA Eastern Standard Time",
      "SA Pacific Standard Time",
      "SA Western Standard Time",
      "Samoa Standard Time",
      "Singapore Standard Time",
      "South Africa Standard Time",
      "Sri Lanka Standard Time",
      "Sudan Standard Time",
      "Syria Standard Time",
      "Taipei Standard Time",
      "Tasmania Standard Time",
      "Tokyo Standard Time",
      "Tonga Standard Time",
      "Turkey Standard Time",
      "US Eastern Standard Time",
      "US Mountain Standard Time",
      "UTC",
      "UTC+12",
      "Venezuela Standard Time",
      "Vladivostok Standard Time",
      "W. Australia Standard Time",
      "W. Central Africa Standard Time",
      "W. Europe Standard Time",
      "West Asia Standard Time",
      "West Pacific Standard Time",
      "Yakutsk Standard Time"
    ], var.sql_timezone)
    error_message = "Invalid Timezone. Choose a valid Azure SQL time zone."
  }
}
