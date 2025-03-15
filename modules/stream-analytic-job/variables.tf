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

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    Environment = "Dev"
    Project     = "TerraformProject"
  }
}