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

variable "admin_username" {
  type    = string
  default = "sql_admin"
}

variable "admin_password" {
  type    = string
  default = "P_e@ssq!_@eate_admin_321"
}


variable "sku_name" {
  type    = string
  default = "GP_Gen5"
}

variable "storage_size" {
  type    = string
  default = 32
}

variable "vcores" {
  type    = string
  default = 4
}

variable "storage_account_type_map" {
  type = map(string)
  default = {
    dev  = "LRS"
    uat  = "LRS"
    prod = "GRS"
  }
}

variable "storage_account_type" {
  type    = string
  default = "LRS"
}

variable "timezone_id" {
  type   = string
  default = "India Standard Time"
}



