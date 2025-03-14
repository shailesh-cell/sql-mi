variable "location" {
  type    = string
  default = "sea"
  validation {
    condition     = contains(["cin", "cus", "sea"], var.location)
    error_message = "Allowed values: cin, cus."
  }
}

# Map short codes to full region names
locals {
  location_map = {
    cin = "centralindia"
    cus = "centralus"
    sea = "southeastasia"
  }
}

# Use the full region name in resource definitions
output "full_location" {
  value = lookup(local.location_map, var.location, "southeastasia")
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

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "sku_name_aa" {
  type    = string
  default = "Free"  # Static default, required by Terraform
}