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

variable "timezone_id" {
  description = "Timezone for Azure SQL Managed Instance"
  type        = string
  default     = "India Standard Time"
  validation {
    condition = contains(["UTC","UTC+12","India Standard Time"], var.timezone_id)
    error_message = "Invalid Timezone. Choose a valid Azure SQL time zone."
  }
}
