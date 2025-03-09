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

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}
